package it.unibs.optalg.cmkp.instance;

import gurobi.GRB;
import gurobi.GRBException;
import gurobi.GRBVar;

public interface Selectable {
    GRBVar getSelectionVar();

    double getObjContribution();

    default void exclude() {
        try {
            this.getSelectionVar().set(GRB.DoubleAttr.LB, 0);
            this.getSelectionVar().set(GRB.DoubleAttr.UB, 0);
        } catch (GRBException e) {
            throw new RuntimeException(e);
        }
    }

    default void force() {
        try {
            this.getSelectionVar().set(GRB.DoubleAttr.LB, 1);
            this.getSelectionVar().set(GRB.DoubleAttr.UB, 1);
        } catch (GRBException e) {
            throw new RuntimeException(e);
        }
    }

    default void allow() {
        try {
            this.getSelectionVar().set(GRB.DoubleAttr.LB, 0);
            this.getSelectionVar().set(GRB.DoubleAttr.UB, 1);
        } catch (GRBException e) {
            throw new RuntimeException(e);
        }
    }

    default boolean isSelected() {
        try {
            return this.getSelectionVar().get(GRB.DoubleAttr.X) >= 0.5;
        } catch (GRBException e) {
            return false;
        }
    }

    default int isSelectedInt() {
        try {
            return (int) Math.round(this.getSelectionVar().get(GRB.DoubleAttr.X));
        } catch (GRBException e) {
            return 0;
        }
    }
}
