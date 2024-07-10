import glob
import re
import itertools
import math

PREAMBLE="""
set -x
mvn clean package -D skipTests
export LD_LIBRARY_PATH=$PWD/gurobi1003/linux64/lib
CP="target/classes:target/lib/*:$PWD/gurobi1003/linux64/lib/gurobi.jar"

"""

TIME_LIMIT=600
BUCKET_SIZE=[(0.2, 0.1, False), (0.4, 0.3, False), (0.2, 0.1, True), (0.4, 0.3, True)]
LOT_CHUNK={
    5: [3, 5],
    8: [4, 8],
    15: [8, 15],
}

OUT_DIR = "runs"

print(PREAMBLE)

for instance in glob.glob("instances/*.json"):
    lots = re.search(r"instance_[0-9]+_([0-9]+)_[0-9]+_[0-9]+.json", instance)
    if lots is None:
        continue

    nlots = int(lots.groups()[0])
    lot_chunk = LOT_CHUNK[nlots]
    for lc, bs in itertools.product(lot_chunk, BUCKET_SIZE):
        remaining = 1-bs[0]
        bucket_it = math.ceil(remaining/bs[1])
        lot_it = math.ceil((nlots/lc))
        if bs[2]:
            bucket_it = bucket_it * 2 - 1
        nit = (1 + bucket_it)*lot_it
        tpb = math.floor(TIME_LIMIT / nit)
        OD = f"{OUT_DIR}/{instance.replace('.json', '').replace('instances/', '')}/{lc}_{bs[0]}_{bs[1]}"
        
        if bs[2]:
            OD += "_overlapped"
            
        ovl = "true" if bs[2] else "false"

        print(f"mkdir -p {OD}/{{building_and_lot_filtering,lot_filtering,std}}")
        if lc < nlots:
            print(f"java -cp \"$CP\" it.unibs.optalg.cmkp.EntryPoint {OD}/building_and_lot_filtering {instance} {TIME_LIMIT} {tpb} {tpb} {bs[0]} {bs[1]} {lc} {ovl} true true |& tee {OD}/building_and_lot_filtering/log")
            print(f"java -cp \"$CP\" it.unibs.optalg.cmkp.EntryPoint {OD}/lot_filtering {instance} {TIME_LIMIT} {tpb} {tpb} {bs[0]} {bs[1]} {lc} {ovl} false true |& tee {OD}/lot_filtering/log")
        print(f"java -cp \"$CP\" it.unibs.optalg.cmkp.EntryPoint {OD}/std {instance} {TIME_LIMIT} {tpb} {tpb} {bs[0]} {bs[1]} {lc} {ovl} false false |& tee {OD}/std/log")



