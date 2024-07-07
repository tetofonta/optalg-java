package it.unibs.optalg.cmkp.instance;

import gurobi.*;
import it.unibs.optalg.cmkp.kernel.Bucket;
import it.unibs.optalg.cmkp.kernel.Bucketable;

import java.util.ArrayList;

public class Lot extends ArrayList<Building> implements Selectable, Copiable, Comparable<Lot>, Bucketable<Building> {
    private final GRBVar var;
    private final GRBModel model;
    public final int index;
    public final double cost;
    public final double[] localCapacities;

    private Double metricValue = 0.0;

    public Lot(GRBModel model, int index, double cost, double[] localCapacities, int capacity, char varType) throws GRBException {
        super(capacity);
        this.var = model.addVar(0, 1, -cost, varType, String.format("lot_%d", index));
        this.index = index;
        this.cost = cost;
        this.localCapacities = localCapacities;
        this.model = model;
    }

    public Lot(GRBModel model, int index, double cost, double[] localCapacities, int capacity) throws GRBException {
        this(model, index, cost, localCapacities, capacity, GRB.BINARY);
    }

    public void makeConstraints() throws GRBException {
        var capacity_lhs = new GRBLinExpr[this.localCapacities.length];

        //building select constraints
        for (var building: this) {
            this.model.addConstr(
                    building.getSelectionVar(),
                    GRB.LESS_EQUAL,
                    this.getSelectionVar(),
                    String.format("building_selection_lot_%d_building_%d", this.index, building.index)
            );
            for (int i = 0; i < this.localCapacities.length; i++) {
                if(capacity_lhs[i] == null)
                    capacity_lhs[i] = new GRBLinExpr();

                capacity_lhs[i].addTerm(building.localWeights[i], building.getSelectionVar());
            }
        }

        //local capacity constraints
        for (int i = 0; i < this.localCapacities.length; i++) {
            this.model.addConstr(capacity_lhs[i], GRB.LESS_EQUAL, this.localCapacities[i], String.format("lot_%d_local_capacity_%d", this.index, i));
        }
    }

    @Override
    public GRBVar getSelectionVar() {
        return this.var;
    }

    @Override
    public double getObjContribution() {
        return -this.cost * this.isSelectedInt();
    }

    @Override
    public Lot copyToModel(GRBModel model, char varType) throws GRBException {
        var lot = new Lot(model, index, cost, localCapacities, this.size(), varType);
        for (var b: this) lot.add(b.copyToModel(model, varType));
        lot.makeConstraints();
        return lot;
    }

    public void updateMetric(double[] availableCapacities) throws GRBException {
        this.metricValue = this.getMetricValue(availableCapacities);
    }

    public double getMetricValue(double[] availableCapacities) throws GRBException {
        if(this.size() == 0) return 0;

        if(availableCapacities.length != this.get(0).globalWeights.length)
            throw new RuntimeException("Invalid capacities length");

        var instance_name = String.format("relax_lot_sort_%d_%d", this.index, System.currentTimeMillis());
        var env = new GRBEnv();
        env.set(GRB.DoubleParam.TimeLimit, 5);
        env.set(GRB.IntParam.LogToConsole, 0);
        env.set(GRB.StringParam.LogFile, String.format("./logs/%s", instance_name));

        var model = new GRBModel(env);
        model.set(GRB.IntAttr.ModelSense, GRB.MAXIMIZE);
        model.set(GRB.StringAttr.ModelName, instance_name);

        var relaxed_instance = new Instance(model, instance_name, availableCapacities, 1, this.size());
        relaxed_instance.add(this.copyToModel(model, GRB.CONTINUOUS));
        relaxed_instance.makeConstraints();
        relaxed_instance.optimize(5);

        return relaxed_instance.objVal();
    }

    @Override
    public int compareTo(Lot buildings) {
        return this.metricValue.compareTo(buildings.metricValue);
    }

    @Override
    public Bucket<Building> getBucket(double k_size, int i, double size, boolean overlapped) {
        int bucketSize = (int) Math.round(this.size() * size);
        int from = Math.min((int) Math.round(k_size*this.size()) + (int) (i*bucketSize/(2*(overlapped ? 1 : 0.5))), this.size());
        int to = Math.min(from + bucketSize, this.size());

        return new Bucket<>(this.subList(from, to));
    }
}
