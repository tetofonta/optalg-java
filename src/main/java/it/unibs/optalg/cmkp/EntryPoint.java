package it.unibs.optalg.cmkp;

import gurobi.GRBException;
import it.unibs.optalg.cmkp.instance.Instance;
import it.unibs.optalg.cmkp.instance.RawInstance;
import it.unibs.optalg.cmkp.kernel.KernelSearch;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class EntryPoint {

    public static String PATH_PREFIX = "";

    public static void main(String[] args) throws IOException, GRBException {
        System.err.println("prefix " + args[0]);
        System.err.println("instance " + args[1]);
        System.err.println("timelimit " + args[2]);
        System.err.println("kernelTime " + args[3]);
        System.err.println("bucketTime " + args[4]);
        System.err.println("kernelSize " + args[5]);
        System.err.println("bucketSize " + args[6]);
        System.err.println("lotsPerIt " + args[7]);
        System.err.println("overlapped " + args[8]);
        System.err.println("filterBuildings " + args[9]);
        System.err.println("filterLots " + args[10]);

        PATH_PREFIX = args[0];
        Files.createDirectories(Paths.get(String.format("%s/models/", PATH_PREFIX)));
        Files.createDirectories(Paths.get(String.format("%s/logs/", PATH_PREFIX)));

        var raw = RawInstance.load(Path.of(args[1]));
        var inst = Instance.from(raw);

        var kernel = new KernelSearch(Integer.parseInt(args[2]), Integer.parseInt(args[3]), Integer.parseInt(args[4]), Double.parseDouble(args[5]), Double.parseDouble(args[6]), Integer.parseInt(args[7]));
        kernel.performKernel(raw, inst, Boolean.parseBoolean(args[8]), Boolean.parseBoolean(args[9]), Boolean.parseBoolean(args[10]));
    }
}
