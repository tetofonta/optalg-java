package it.unibs.optalg.cmkp.kernel;

public record BestSolution(
        int[] buildings,
        int[] lots,
        double obj,
        double[] remainingGlobal
) {
}
