package it.unibs.optalg.cmkp.instance;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public record RawInstance(
        String name,
        int nItems,
        int nLots,
        int nGlobalResources,
        int nLocalResourcesPerLot,
        int[] profits,
        int[] lotCosts,
        int[][] globalWeights,
        int[][][] localWeights,
        int[] globalCapacities,
        int[][] localCapacities
) {
    private static final ObjectMapper OBJ_MAPPER = new ObjectMapper();

    public static RawInstance load(final Path path) throws IOException {
        return OBJ_MAPPER.readValue(path.toFile(), RawInstance.class);
    }

    public FeasibilityCheck checkFeasibility(final int[] solution, final int objValue) {
        if (solution == null) {
            final String errMsg = "Solution can not be null";
            return new FeasibilityCheck(false, new String[]{errMsg});
        } else if (solution.length != nItems) {
            final String errMsg = "Solution contains " + solution.length + " items instead of " + nItems;
            return new FeasibilityCheck(false, new String[]{errMsg});
        }

        boolean isValid = true;
        final List<String> errors = new ArrayList<>();

        int expectedObjValue = 0;
        final Set<Integer> usedLots = new HashSet<>();
        final int[] globalResourceUsage = new int[nGlobalResources];
        final int[][] localResourceUsage = new int[nLots][nLocalResourcesPerLot];
        int xoffset = 0;
        for (int l = 0; l < nLots; ++l) {
            final int lotSize = localWeights[l][0].length;
            for (int iLocal = 0, iGlobal = xoffset; iLocal < lotSize; ++iLocal, ++iGlobal) {
                final int val = solution[iGlobal];
                if (val == 1) {
                    expectedObjValue += profits[iGlobal];
                    usedLots.add(l);

                    for (int r = 0; r < nGlobalResources; ++r) {
                        globalResourceUsage[r] += globalWeights[r][iGlobal];
                    }

                    for (int r = 0; r < nLocalResourcesPerLot; ++r) {
                        localResourceUsage[l][r] += localWeights[l][r][iLocal];
                    }
                } else if (val != 0) {
                    isValid = false;
                    errors.add("solution[" + iLocal + "] = " + val + " (must be either 0 or 1)");
                }
            }
            xoffset += lotSize;
        }

        for (final int l : usedLots) {
            expectedObjValue -= lotCosts[l];
        }

        if (expectedObjValue != objValue) {
            isValid = false;
            errors.add("Expected solution value is " + expectedObjValue + ", got " + objValue);
        }

        for (int r = 0; r < nGlobalResources; ++r) {
            if (globalResourceUsage[r] > globalCapacities[r]) {
                isValid = false;
                errors.add(
                        "Provided solution use " + globalResourceUsage[r] + " of global resource " + r +
                                ", maximum capacity is " + globalCapacities[r]
                );
            }
        }

        for (int l = 0; l < nLots; ++l) {
            for (int r = 0; r < nLocalResourcesPerLot; ++r) {
                if (localResourceUsage[l][r] > localCapacities[l][r]) {
                    isValid = false;
                    errors.add(
                            "Provided solution use " + localResourceUsage[l][r] + " of local resource " + r +
                                    "in lot " + l + ", maximum capacity is " + localCapacities[l][r]
                    );
                }
            }
        }

        return new FeasibilityCheck(isValid, errors.toArray(new String[0]));
    }


}
