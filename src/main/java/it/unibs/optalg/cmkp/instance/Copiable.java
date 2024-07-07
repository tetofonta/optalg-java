package it.unibs.optalg.cmkp.instance;

import gurobi.GRBException;
import gurobi.GRBModel;

public interface Copiable {
    Copiable copyToModel(GRBModel model, char varType) throws GRBException;
}
