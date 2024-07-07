package it.unibs.optalg.cmkp.kernel;

import gurobi.GRB;
import gurobi.GRBException;
import it.unibs.optalg.cmkp.instance.*;

import java.util.*;
import java.util.stream.Collectors;

record OrderingPair<A, B>(
    A val,
    B rc
){}

public class KernelSearch {

    public final double timeLimit;
    public final double kernelTimeLimit;
    public final double bucketTimeLimit;
    public final double kernelSize;
    public final double bucketSize;
    public final int lotChunkSize;
    private BestSolution best;

    public KernelSearch(double timeLimit, double kernelTimeLimit, double bucketTimeLimit, double kernelSize, double bucketSize, int lotChunkSize) {
        this.timeLimit = timeLimit;
        this.kernelTimeLimit = kernelTimeLimit;
        this.bucketTimeLimit = bucketTimeLimit;
        this.kernelSize = kernelSize;
        this.bucketSize = bucketSize;
        this.lotChunkSize = lotChunkSize;
    }


    private void excludeFullLot(Lot l) {
        for (var b: l) b.exclude();
        l.exclude();
    }

    private Lot allowFullLot(Lot l) {
        for (var b: l) b.allow();
        l.allow();
        return l;
    }

    private Lot allowOnlyLot(Lot l) {
        for (var b: l) b.exclude();
        l.allow();
        return l;
    }

    private void extractLots(List<Lot> from, List<Lot> to, int n) {
        while (n-- > 0 && !from.isEmpty()) {
            to.add(this.allowOnlyLot(from.removeLast()));
        }
    }

    private void sortBuildings(ArrayList<Lot> current_solution, Instance i, int it) throws GRBException {
        var relaxed_instance = i.relax();
        var to_keep = current_solution.stream().mapToInt(x -> x.index).boxed().collect(Collectors.toSet());
        for(var lot: relaxed_instance) if(!to_keep.contains(lot.index)) this.excludeFullLot(lot);
        relaxed_instance.optimize(String.format("./relaxed_instance_building_sort_it_%d", it), 5);

        //populate an ordering map
        var ordering_map = new HashMap<Integer, OrderingPair<Double, Double>>();
        for(var lot: relaxed_instance)
            if(to_keep.contains(lot.index))
                for(var building: lot)
                    ordering_map.put(building.index, new OrderingPair<>(building.getSelectionVar().get(GRB.DoubleAttr.X), Math.abs(building.getSelectionVar().get(GRB.DoubleAttr.RC))));


        //order every lot
        for(var lot: i) {
            if(to_keep.contains(lot.index)){
                lot.sort((a, b) -> {
                    if(Objects.equals(ordering_map.get(a.index).val(), ordering_map.get(b.index).val())){
                        return ordering_map.get(a.index).rc().compareTo(ordering_map.get(b.index).rc());
                    }
                    return -ordering_map.get(a.index).val().compareTo(ordering_map.get(b.index).val());
                });
            }
        }
    }

    public void setCutOff(Instance i) throws GRBException {
        if(i.solCount() > 0)
            i.model.set(GRB.DoubleParam.Cutoff, i.objVal());
    }

    public void storeBestSolution(Instance i) throws GRBException {
        if(i.solCount() == 0) return;

        var lots = new int[i.size()];
        for(var l: i)
            lots[l.index] = l.isSelectedInt();

        this.best = new BestSolution(i.retrieveSolution(), lots, i.objVal(), i.getRemainingGlobalCapacities());
    }


    public Kernel performBuildingKernel(Kernel kernel, ArrayList<Lot> current_solution, Instance i, RawInstance raw, int it, boolean overlapped, long now) throws GRBException {
        //sort buildings for bucketing
        this.sortBuildings(current_solution, i, it);

        //build the kernel
        for(var lot: current_solution)
            kernel.addAll(lot.getBucket(0, 0, this.kernelSize, false).allow());

        //resolve the kernel
        i.optimize(String.format("kernel_solve_it_%d", it), Math.min(this.kernelTimeLimit, this.timeLimit - (System.currentTimeMillis() - now)/1000.0));
        this.setCutOff(i);
        this.storeBestSolution(i);
        if(System.currentTimeMillis() - now >= this.timeLimit*1000) return kernel;

        //execute buckets
        var bucketIndex = 0;
        while(true) {
            var bucket = new Bucket<>();
            for(var lot: current_solution)
                bucket.addAll(lot.getBucket(this.kernelSize, bucketIndex, this.bucketSize, overlapped).allow());

            if(bucket.isEmpty()) break;
            var constr = bucket.addBucketConstraints(i.model);

            i.optimize(String.format("kernel_solve_it_%d_bucket_%d", it, bucketIndex), Math.min(this.bucketTimeLimit, this.timeLimit - (System.currentTimeMillis() - now)/1000.0));
            this.setCutOff(i);
            this.storeBestSolution(i);
            if(System.currentTimeMillis() - now >= this.timeLimit*1000) return kernel;

            if(i.solCount() > 0) {
                for(var b: bucket){
                    if(b.isSelected()) kernel.add((Building) b);
                    else b.exclude();
                }

                var f = raw.checkFeasibility(i.retrieveSolution(), (int) i.objVal());
                System.err.printf("SOL IT %d BUKET %d VAL %.2f OK %b TOOK %.2f\n", it, bucketIndex, i.objVal(), f.isValid(), (System.currentTimeMillis() - now) / 1000.0);
            } else {
                for(var b: bucket){
                    b.exclude();
                }
                System.err.printf("NO SOL IT %d BUKET %d TOOK %.2f\n", it, bucketIndex, (System.currentTimeMillis() - now) / 1000.0);
            }

            i.model.remove(constr);
            bucketIndex++;
        }

        return kernel;
    }

    public BestSolution performKernel(RawInstance raw, Instance i, boolean overlapped, boolean filterBuildings, boolean filterLots) throws GRBException {
        var now = System.currentTimeMillis();
        //nothing can be selected rn. also calculate lot metric for sorting
        var avail = i.getRemainingGlobalCapacities();
        for(var l: i) {
            this.excludeFullLot(l);
            l.updateMetric(avail);
        }

        var current_lots = new ArrayList<Lot>(i.size());
        var rejected_lots = new ArrayList<Lot>(i.size());
        var available_lots = new ArrayList<>(i);
        var it = 0;
        var kernel = new Kernel();

        //sort lots for chunking. Last one is the best one
        Collections.sort(available_lots);


        while(!available_lots.isEmpty()) {
            this.extractLots(available_lots, current_lots, this.lotChunkSize); //extracted lots can now be selected
            kernel = this.performBuildingKernel(kernel, current_lots, i, raw, it, overlapped, now);
            if(System.currentTimeMillis() - now >= this.timeLimit*1000) break;


            available_lots.addAll(rejected_lots);
            rejected_lots.clear();

            if(filterBuildings) this.filterBuildings(kernel);
            if(filterLots) this.filterLots(current_lots, rejected_lots);

            if(this.best != null)
                for(var l: available_lots) {
                    l.updateMetric(this.best.remainingGlobal());
                }
            Collections.sort(available_lots);


            it++;
        }


        System.err.println("Took " + (System.currentTimeMillis() - now)/1000 + "s");

        if(this.best == null){
            System.err.println("NO SOLUTION");
            return null;
        }

        var f = raw.checkFeasibility(best.buildings(), (int) best.obj());
        System.err.printf("SOL VAL %.2f OK %b\n", best.obj(), f.isValid());
        return this.best;
    }

    private void filterBuildings(Kernel kernel) {
        if(this.best != null) {
            for(var b: kernel)
                if(this.best.buildings()[b.index] == 0){
                    b.exclude();
                }
            kernel.removeIf(x -> this.best.buildings()[x.index] == 0);
        }
    }

    private void filterLots(ArrayList<Lot> current, ArrayList<Lot> rejected) {
        if(this.best != null) {
            for(var l: current) {
                if(this.best.lots()[l.index] == 0) {
                    rejected.add(l);
                    l.exclude();
                }
            }
            current.removeIf(x -> this.best.lots()[x.index] == 0);
        }
    }

}
