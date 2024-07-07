package it.unibs.optalg.cmkp.instance;

import gurobi.GRB;
import gurobi.GRBException;
import gurobi.GRBModel;
import gurobi.GRBVar;

public class Building implements Selectable, Copiable {

    private final GRBVar var;
    public final int index;
    public final double profit;
    public final double[] globalWeights;
    public final double[] localWeights;


    public Building(GRBModel model, int index, double profit, double[] globalWeights, double[] localWeights, char varType) throws GRBException {
        this.var = model.addVar(0, 1, profit, varType, String.format("building_%d", index));
        this.index = index;
        this.profit = profit;
        this.globalWeights = globalWeights;
        this.localWeights = localWeights;
    }

    public Building(GRBModel model, int index, double profit, double[] globalWeights, double[] localWeights) throws GRBException {
        this(model, index, profit, globalWeights, localWeights, GRB.BINARY);
    }

    @Override
    public GRBVar getSelectionVar() {
        return this.var;
    }

    @Override
    public double getObjContribution() {
        return this.profit * this.isSelectedInt();
    }


    @Override
    public Building copyToModel(GRBModel model, char varType) throws GRBException {
        return new Building(model, index, profit, globalWeights, localWeights, varType);
    }


}
