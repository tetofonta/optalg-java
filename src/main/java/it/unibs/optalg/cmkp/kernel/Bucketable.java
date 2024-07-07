package it.unibs.optalg.cmkp.kernel;

import it.unibs.optalg.cmkp.instance.Selectable;

public interface Bucketable<T extends Selectable> {

    Bucket<T> getBucket(double k_size, int i, double size, boolean overlapped);

}
