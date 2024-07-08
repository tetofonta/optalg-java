package it.unibs.optalg.cmkp.instance;

import gurobi.*;
import it.unibs.optalg.cmkp.EntryPoint;
import it.unibs.optalg.cmkp.kernel.Bucket;
import it.unibs.optalg.cmkp.kernel.Bucketable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

public class Instance extends ArrayList<Lot> implements Copiable {

    public final GRBModel model;
    public final double[] globalCapacities;
    public final String name;
    public int nBuildings;

    public Instance(GRBModel model, String name, double[] globalCapacities, int capacity, int nBuildings) {
        super(capacity);
        this.model = model;
        this.name = name;
        this.globalCapacities = globalCapacities;
        this.nBuildings = nBuildings;
    }

    public void makeConstraints() throws GRBException {
        for (int i = 0; i < this.globalCapacities.length; i++) {
            var lhs = new GRBLinExpr();
            for (var lot : this) {
                for (var building : lot) {
                    lhs.addTerm(building.globalWeights[i], building.getSelectionVar());
                }
            }
            this.model.addConstr(lhs, GRB.LESS_EQUAL, this.globalCapacities[i], String.format("global_capacity_%d", i));
        }
    }

    @Override
    public Instance copyToModel(GRBModel model, char varType) throws GRBException {
        var inst = new Instance(model, this.name, this.globalCapacities, this.size(), this.nBuildings);
        for (var lot : this) inst.add(lot.copyToModel(model, varType));
        inst.makeConstraints();
        return inst;
    }

    public void update() throws GRBException {
        this.model.update();
    }

    public void write() throws GRBException {
        this.write(this.name);
    }

    public void write(String model_name) throws GRBException {
        this.model.write(String.format("%s/models/%s.lp", EntryPoint.PATH_PREFIX, model_name));
    }

    public void optimize(double timeout) throws GRBException {
        this.optimize(this.name, timeout);
    }

    public void optimize(String model_name, double timeout) throws GRBException {
        this.model.set(GRB.StringAttr.ModelName, model_name);
        this.write(model_name);
        this.update();
        this.model.set(GRB.DoubleParam.TimeLimit, timeout);
        this.model.optimize();
    }

    public int solCount() throws GRBException {
        return this.model.get(GRB.IntAttr.SolCount);
    }

    public double objVal() throws GRBException {
        if (solCount() == 0) return Double.NaN;
        return this.model.get(GRB.DoubleAttr.ObjVal);
    }

    private static double[] doubleToInt(int[] arr) {
        return Arrays.stream(arr).mapToDouble(x -> x).toArray();
    }

    private static double[] doubleColumn(int[][] arr, int col) {
        return Arrays.stream(arr).mapToDouble(x -> x[col]).toArray();
    }

    public static Instance from(RawInstance inst) throws GRBException {
        var env = new GRBEnv();
        env.set(GRB.DoubleParam.MIPGap, 1e-8);
        env.set(GRB.IntParam.LogToConsole, 0);
        env.set(GRB.StringParam.LogFile, String.format("%s/logs/%s", EntryPoint.PATH_PREFIX, inst.name()));

        var model = new GRBModel(env);
        model.set(GRB.IntAttr.ModelSense, GRB.MAXIMIZE);

        var instance = new Instance(model, inst.name(), doubleToInt(inst.globalCapacities()), inst.nLots(), inst.nItems());
        var global_building_index = 0;
        for (int l = 0; l < inst.nLots(); l++) {
            var lot = new Lot(model, l, inst.lotCosts()[l], doubleToInt(inst.localCapacities()[l]), inst.localWeights()[l][0].length);
            for (int local_building_index = 0; local_building_index < inst.localWeights()[l][0].length; local_building_index++) {
                lot.add(new Building(
                        model,
                        global_building_index,
                        inst.profits()[global_building_index],
                        doubleColumn(inst.globalWeights(), global_building_index),
                        doubleColumn(inst.localWeights()[l], local_building_index)
                ));
                global_building_index++;
            }
            lot.makeConstraints();
            instance.add(lot);
        }
        instance.makeConstraints();
        return instance;
    }

    public int[] retrieveSolution(){
        var arr = new int[this.nBuildings];
        for (var lot: this)
            for (var b: lot)
                arr[b.index] = b.isSelectedInt();
        return arr;
    }

    public double[] getRemainingGlobalCapacities() {
        return this.stream()
                .flatMap(List::stream)
                .filter(Selectable::isSelected)
                .map(x -> x.globalWeights)
                .reduce(this.globalCapacities, (acc, w) -> IntStream.range(0, acc.length).mapToDouble(i -> acc[i] - w[i]).toArray());
    }

    public Instance relax() throws GRBException {
        var instance_name = String.format("relax_instance_%d", System.currentTimeMillis());
        var env = new GRBEnv();
        env.set(GRB.DoubleParam.TimeLimit, 5);
        env.set(GRB.IntParam.LogToConsole, 0);
        env.set(GRB.StringParam.LogFile, String.format("%s/logs/%s", EntryPoint.PATH_PREFIX, instance_name));

        var model = new GRBModel(env);
        model.set(GRB.IntAttr.ModelSense, GRB.MAXIMIZE);
        model.set(GRB.StringAttr.ModelName, instance_name);

        return this.copyToModel(model, GRB.CONTINUOUS);
    }

}
