package it.unibs.optalg.cmkp.kernel;

import gurobi.*;
import it.unibs.optalg.cmkp.instance.Selectable;

import java.util.ArrayList;
import java.util.Collection;

public class Bucket<T extends Selectable> extends ArrayList<T> {

    public Bucket(int initialCapacity) {
        super(initialCapacity);
    }

    public Bucket() {
    }

    public Bucket(Collection<? extends T> c) {
        super(c);
    }

    public Bucket<T> allow(){
        for(var b: this) b.allow();
        return this;
    }

    public GRBConstr addBucketConstraints(GRBModel model) throws GRBException {
        var lhs = new GRBLinExpr();
        for(var b: this)
            lhs.addTerm(1.0, b.getSelectionVar());
        return model.addConstr(lhs, GRB.GREATER_EQUAL, 1, "must_select_bucket");
    }
}
