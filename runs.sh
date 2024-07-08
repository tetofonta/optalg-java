
set -x
mvn clean package -D skipTests
export LD_LIBRARY_PATH=$PWD/gurobi1003/linux64/lib
CP="target/classes:target/lib/*:$PWD/gurobi1003/linux64/lib/gurobi.jar"


mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.2_0.1/building_and_lot_filtering instances/instance_2000_8_30_8.json 600 33 33 0.2 0.1 4 false true true |& tee runs/instance_2000_8_30_8/4_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.2_0.1/lot_filtering instances/instance_2000_8_30_8.json 600 33 33 0.2 0.1 4 false false true |& tee runs/instance_2000_8_30_8/4_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.2_0.1/std instances/instance_2000_8_30_8.json 600 33 33 0.2 0.1 4 false false false |& tee runs/instance_2000_8_30_8/4_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.4_0.4/building_and_lot_filtering instances/instance_2000_8_30_8.json 600 42 42 0.4 0.4 4 false true true |& tee runs/instance_2000_8_30_8/4_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.4_0.4/lot_filtering instances/instance_2000_8_30_8.json 600 42 42 0.4 0.4 4 false false true |& tee runs/instance_2000_8_30_8/4_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.4_0.4/std instances/instance_2000_8_30_8.json 600 42 42 0.4 0.4 4 false false false |& tee runs/instance_2000_8_30_8/4_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/8_0.2_0.1/building_and_lot_filtering instances/instance_2000_8_30_8.json 600 66 66 0.2 0.1 8 false true true |& tee runs/instance_2000_8_30_8/8_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/8_0.2_0.1/lot_filtering instances/instance_2000_8_30_8.json 600 66 66 0.2 0.1 8 false false true |& tee runs/instance_2000_8_30_8/8_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/8_0.2_0.1/std instances/instance_2000_8_30_8.json 600 66 66 0.2 0.1 8 false false false |& tee runs/instance_2000_8_30_8/8_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/8_0.4_0.4/building_and_lot_filtering instances/instance_2000_8_30_8.json 600 85 85 0.4 0.4 8 false true true |& tee runs/instance_2000_8_30_8/8_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/8_0.4_0.4/lot_filtering instances/instance_2000_8_30_8.json 600 85 85 0.4 0.4 8 false false true |& tee runs/instance_2000_8_30_8/8_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/8_0.4_0.4/std instances/instance_2000_8_30_8.json 600 85 85 0.4 0.4 8 false false false |& tee runs/instance_2000_8_30_8/8_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.2_0.1/building_and_lot_filtering instances/instance_7500_15_30_12.json 600 33 33 0.2 0.1 8 false true true |& tee runs/instance_7500_15_30_12/8_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.2_0.1/lot_filtering instances/instance_7500_15_30_12.json 600 33 33 0.2 0.1 8 false false true |& tee runs/instance_7500_15_30_12/8_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.2_0.1/std instances/instance_7500_15_30_12.json 600 33 33 0.2 0.1 8 false false false |& tee runs/instance_7500_15_30_12/8_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.4_0.4/building_and_lot_filtering instances/instance_7500_15_30_12.json 600 42 42 0.4 0.4 8 false true true |& tee runs/instance_7500_15_30_12/8_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.4_0.4/lot_filtering instances/instance_7500_15_30_12.json 600 42 42 0.4 0.4 8 false false true |& tee runs/instance_7500_15_30_12/8_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.4_0.4/std instances/instance_7500_15_30_12.json 600 42 42 0.4 0.4 8 false false false |& tee runs/instance_7500_15_30_12/8_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/15_0.2_0.1/building_and_lot_filtering instances/instance_7500_15_30_12.json 600 66 66 0.2 0.1 15 false true true |& tee runs/instance_7500_15_30_12/15_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/15_0.2_0.1/lot_filtering instances/instance_7500_15_30_12.json 600 66 66 0.2 0.1 15 false false true |& tee runs/instance_7500_15_30_12/15_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/15_0.2_0.1/std instances/instance_7500_15_30_12.json 600 66 66 0.2 0.1 15 false false false |& tee runs/instance_7500_15_30_12/15_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/15_0.4_0.4/building_and_lot_filtering instances/instance_7500_15_30_12.json 600 85 85 0.4 0.4 15 false true true |& tee runs/instance_7500_15_30_12/15_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/15_0.4_0.4/lot_filtering instances/instance_7500_15_30_12.json 600 85 85 0.4 0.4 15 false false true |& tee runs/instance_7500_15_30_12/15_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/15_0.4_0.4/std instances/instance_7500_15_30_12.json 600 85 85 0.4 0.4 15 false false false |& tee runs/instance_7500_15_30_12/15_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.2_0.1/building_and_lot_filtering instances/instance_500_5_30_12.json 600 33 33 0.2 0.1 3 false true true |& tee runs/instance_500_5_30_12/3_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.2_0.1/lot_filtering instances/instance_500_5_30_12.json 600 33 33 0.2 0.1 3 false false true |& tee runs/instance_500_5_30_12/3_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.2_0.1/std instances/instance_500_5_30_12.json 600 33 33 0.2 0.1 3 false false false |& tee runs/instance_500_5_30_12/3_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.4_0.4/building_and_lot_filtering instances/instance_500_5_30_12.json 600 42 42 0.4 0.4 3 false true true |& tee runs/instance_500_5_30_12/3_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.4_0.4/lot_filtering instances/instance_500_5_30_12.json 600 42 42 0.4 0.4 3 false false true |& tee runs/instance_500_5_30_12/3_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.4_0.4/std instances/instance_500_5_30_12.json 600 42 42 0.4 0.4 3 false false false |& tee runs/instance_500_5_30_12/3_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/5_0.2_0.1/building_and_lot_filtering instances/instance_500_5_30_12.json 600 66 66 0.2 0.1 5 false true true |& tee runs/instance_500_5_30_12/5_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/5_0.2_0.1/lot_filtering instances/instance_500_5_30_12.json 600 66 66 0.2 0.1 5 false false true |& tee runs/instance_500_5_30_12/5_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/5_0.2_0.1/std instances/instance_500_5_30_12.json 600 66 66 0.2 0.1 5 false false false |& tee runs/instance_500_5_30_12/5_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/5_0.4_0.4/building_and_lot_filtering instances/instance_500_5_30_12.json 600 85 85 0.4 0.4 5 false true true |& tee runs/instance_500_5_30_12/5_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/5_0.4_0.4/lot_filtering instances/instance_500_5_30_12.json 600 85 85 0.4 0.4 5 false false true |& tee runs/instance_500_5_30_12/5_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/5_0.4_0.4/std instances/instance_500_5_30_12.json 600 85 85 0.4 0.4 5 false false false |& tee runs/instance_500_5_30_12/5_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.2_0.1/building_and_lot_filtering instances/instance_7500_15_30_8.json 600 33 33 0.2 0.1 8 false true true |& tee runs/instance_7500_15_30_8/8_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.2_0.1/lot_filtering instances/instance_7500_15_30_8.json 600 33 33 0.2 0.1 8 false false true |& tee runs/instance_7500_15_30_8/8_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.2_0.1/std instances/instance_7500_15_30_8.json 600 33 33 0.2 0.1 8 false false false |& tee runs/instance_7500_15_30_8/8_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.4_0.4/building_and_lot_filtering instances/instance_7500_15_30_8.json 600 42 42 0.4 0.4 8 false true true |& tee runs/instance_7500_15_30_8/8_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.4_0.4/lot_filtering instances/instance_7500_15_30_8.json 600 42 42 0.4 0.4 8 false false true |& tee runs/instance_7500_15_30_8/8_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.4_0.4/std instances/instance_7500_15_30_8.json 600 42 42 0.4 0.4 8 false false false |& tee runs/instance_7500_15_30_8/8_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/15_0.2_0.1/building_and_lot_filtering instances/instance_7500_15_30_8.json 600 66 66 0.2 0.1 15 false true true |& tee runs/instance_7500_15_30_8/15_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/15_0.2_0.1/lot_filtering instances/instance_7500_15_30_8.json 600 66 66 0.2 0.1 15 false false true |& tee runs/instance_7500_15_30_8/15_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/15_0.2_0.1/std instances/instance_7500_15_30_8.json 600 66 66 0.2 0.1 15 false false false |& tee runs/instance_7500_15_30_8/15_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/15_0.4_0.4/building_and_lot_filtering instances/instance_7500_15_30_8.json 600 85 85 0.4 0.4 15 false true true |& tee runs/instance_7500_15_30_8/15_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/15_0.4_0.4/lot_filtering instances/instance_7500_15_30_8.json 600 85 85 0.4 0.4 15 false false true |& tee runs/instance_7500_15_30_8/15_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/15_0.4_0.4/std instances/instance_7500_15_30_8.json 600 85 85 0.4 0.4 15 false false false |& tee runs/instance_7500_15_30_8/15_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.2_0.1/building_and_lot_filtering instances/instance_2000_8_30_12.json 600 33 33 0.2 0.1 4 false true true |& tee runs/instance_2000_8_30_12/4_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.2_0.1/lot_filtering instances/instance_2000_8_30_12.json 600 33 33 0.2 0.1 4 false false true |& tee runs/instance_2000_8_30_12/4_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.2_0.1/std instances/instance_2000_8_30_12.json 600 33 33 0.2 0.1 4 false false false |& tee runs/instance_2000_8_30_12/4_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.4_0.4/building_and_lot_filtering instances/instance_2000_8_30_12.json 600 42 42 0.4 0.4 4 false true true |& tee runs/instance_2000_8_30_12/4_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.4_0.4/lot_filtering instances/instance_2000_8_30_12.json 600 42 42 0.4 0.4 4 false false true |& tee runs/instance_2000_8_30_12/4_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.4_0.4/std instances/instance_2000_8_30_12.json 600 42 42 0.4 0.4 4 false false false |& tee runs/instance_2000_8_30_12/4_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/8_0.2_0.1/building_and_lot_filtering instances/instance_2000_8_30_12.json 600 66 66 0.2 0.1 8 false true true |& tee runs/instance_2000_8_30_12/8_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/8_0.2_0.1/lot_filtering instances/instance_2000_8_30_12.json 600 66 66 0.2 0.1 8 false false true |& tee runs/instance_2000_8_30_12/8_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/8_0.2_0.1/std instances/instance_2000_8_30_12.json 600 66 66 0.2 0.1 8 false false false |& tee runs/instance_2000_8_30_12/8_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/8_0.4_0.4/building_and_lot_filtering instances/instance_2000_8_30_12.json 600 85 85 0.4 0.4 8 false true true |& tee runs/instance_2000_8_30_12/8_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/8_0.4_0.4/lot_filtering instances/instance_2000_8_30_12.json 600 85 85 0.4 0.4 8 false false true |& tee runs/instance_2000_8_30_12/8_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/8_0.4_0.4/std instances/instance_2000_8_30_12.json 600 85 85 0.4 0.4 8 false false false |& tee runs/instance_2000_8_30_12/8_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.2_0.1/building_and_lot_filtering instances/instance_500_5_30_8.json 600 33 33 0.2 0.1 3 false true true |& tee runs/instance_500_5_30_8/3_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.2_0.1/lot_filtering instances/instance_500_5_30_8.json 600 33 33 0.2 0.1 3 false false true |& tee runs/instance_500_5_30_8/3_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.2_0.1/std instances/instance_500_5_30_8.json 600 33 33 0.2 0.1 3 false false false |& tee runs/instance_500_5_30_8/3_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.4_0.4/building_and_lot_filtering instances/instance_500_5_30_8.json 600 42 42 0.4 0.4 3 false true true |& tee runs/instance_500_5_30_8/3_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.4_0.4/lot_filtering instances/instance_500_5_30_8.json 600 42 42 0.4 0.4 3 false false true |& tee runs/instance_500_5_30_8/3_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.4_0.4/std instances/instance_500_5_30_8.json 600 42 42 0.4 0.4 3 false false false |& tee runs/instance_500_5_30_8/3_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/5_0.2_0.1/building_and_lot_filtering instances/instance_500_5_30_8.json 600 66 66 0.2 0.1 5 false true true |& tee runs/instance_500_5_30_8/5_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/5_0.2_0.1/lot_filtering instances/instance_500_5_30_8.json 600 66 66 0.2 0.1 5 false false true |& tee runs/instance_500_5_30_8/5_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/5_0.2_0.1/std instances/instance_500_5_30_8.json 600 66 66 0.2 0.1 5 false false false |& tee runs/instance_500_5_30_8/5_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/5_0.4_0.4/building_and_lot_filtering instances/instance_500_5_30_8.json 600 85 85 0.4 0.4 5 false true true |& tee runs/instance_500_5_30_8/5_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/5_0.4_0.4/lot_filtering instances/instance_500_5_30_8.json 600 85 85 0.4 0.4 5 false false true |& tee runs/instance_500_5_30_8/5_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/5_0.4_0.4/std instances/instance_500_5_30_8.json 600 85 85 0.4 0.4 5 false false false |& tee runs/instance_500_5_30_8/5_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.2_0.1/building_and_lot_filtering instances/instance_500_5_30_10.json 600 33 33 0.2 0.1 3 false true true |& tee runs/instance_500_5_30_10/3_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.2_0.1/lot_filtering instances/instance_500_5_30_10.json 600 33 33 0.2 0.1 3 false false true |& tee runs/instance_500_5_30_10/3_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.2_0.1/std instances/instance_500_5_30_10.json 600 33 33 0.2 0.1 3 false false false |& tee runs/instance_500_5_30_10/3_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.4_0.4/building_and_lot_filtering instances/instance_500_5_30_10.json 600 42 42 0.4 0.4 3 false true true |& tee runs/instance_500_5_30_10/3_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.4_0.4/lot_filtering instances/instance_500_5_30_10.json 600 42 42 0.4 0.4 3 false false true |& tee runs/instance_500_5_30_10/3_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.4_0.4/std instances/instance_500_5_30_10.json 600 42 42 0.4 0.4 3 false false false |& tee runs/instance_500_5_30_10/3_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/5_0.2_0.1/building_and_lot_filtering instances/instance_500_5_30_10.json 600 66 66 0.2 0.1 5 false true true |& tee runs/instance_500_5_30_10/5_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/5_0.2_0.1/lot_filtering instances/instance_500_5_30_10.json 600 66 66 0.2 0.1 5 false false true |& tee runs/instance_500_5_30_10/5_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/5_0.2_0.1/std instances/instance_500_5_30_10.json 600 66 66 0.2 0.1 5 false false false |& tee runs/instance_500_5_30_10/5_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/5_0.4_0.4/building_and_lot_filtering instances/instance_500_5_30_10.json 600 85 85 0.4 0.4 5 false true true |& tee runs/instance_500_5_30_10/5_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/5_0.4_0.4/lot_filtering instances/instance_500_5_30_10.json 600 85 85 0.4 0.4 5 false false true |& tee runs/instance_500_5_30_10/5_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/5_0.4_0.4/std instances/instance_500_5_30_10.json 600 85 85 0.4 0.4 5 false false false |& tee runs/instance_500_5_30_10/5_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.2_0.1/building_and_lot_filtering instances/instance_7500_15_30_10.json 600 33 33 0.2 0.1 8 false true true |& tee runs/instance_7500_15_30_10/8_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.2_0.1/lot_filtering instances/instance_7500_15_30_10.json 600 33 33 0.2 0.1 8 false false true |& tee runs/instance_7500_15_30_10/8_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.2_0.1/std instances/instance_7500_15_30_10.json 600 33 33 0.2 0.1 8 false false false |& tee runs/instance_7500_15_30_10/8_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.4_0.4/building_and_lot_filtering instances/instance_7500_15_30_10.json 600 42 42 0.4 0.4 8 false true true |& tee runs/instance_7500_15_30_10/8_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.4_0.4/lot_filtering instances/instance_7500_15_30_10.json 600 42 42 0.4 0.4 8 false false true |& tee runs/instance_7500_15_30_10/8_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.4_0.4/std instances/instance_7500_15_30_10.json 600 42 42 0.4 0.4 8 false false false |& tee runs/instance_7500_15_30_10/8_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/15_0.2_0.1/building_and_lot_filtering instances/instance_7500_15_30_10.json 600 66 66 0.2 0.1 15 false true true |& tee runs/instance_7500_15_30_10/15_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/15_0.2_0.1/lot_filtering instances/instance_7500_15_30_10.json 600 66 66 0.2 0.1 15 false false true |& tee runs/instance_7500_15_30_10/15_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/15_0.2_0.1/std instances/instance_7500_15_30_10.json 600 66 66 0.2 0.1 15 false false false |& tee runs/instance_7500_15_30_10/15_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/15_0.4_0.4/building_and_lot_filtering instances/instance_7500_15_30_10.json 600 85 85 0.4 0.4 15 false true true |& tee runs/instance_7500_15_30_10/15_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/15_0.4_0.4/lot_filtering instances/instance_7500_15_30_10.json 600 85 85 0.4 0.4 15 false false true |& tee runs/instance_7500_15_30_10/15_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/15_0.4_0.4/std instances/instance_7500_15_30_10.json 600 85 85 0.4 0.4 15 false false false |& tee runs/instance_7500_15_30_10/15_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.2_0.1/building_and_lot_filtering instances/instance_2000_8_30_10.json 600 33 33 0.2 0.1 4 false true true |& tee runs/instance_2000_8_30_10/4_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.2_0.1/lot_filtering instances/instance_2000_8_30_10.json 600 33 33 0.2 0.1 4 false false true |& tee runs/instance_2000_8_30_10/4_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.2_0.1/std instances/instance_2000_8_30_10.json 600 33 33 0.2 0.1 4 false false false |& tee runs/instance_2000_8_30_10/4_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.4_0.4/building_and_lot_filtering instances/instance_2000_8_30_10.json 600 42 42 0.4 0.4 4 false true true |& tee runs/instance_2000_8_30_10/4_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.4_0.4/lot_filtering instances/instance_2000_8_30_10.json 600 42 42 0.4 0.4 4 false false true |& tee runs/instance_2000_8_30_10/4_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.4_0.4/std instances/instance_2000_8_30_10.json 600 42 42 0.4 0.4 4 false false false |& tee runs/instance_2000_8_30_10/4_0.4_0.4/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/8_0.2_0.1/building_and_lot_filtering instances/instance_2000_8_30_10.json 600 66 66 0.2 0.1 8 false true true |& tee runs/instance_2000_8_30_10/8_0.2_0.1/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/8_0.2_0.1/lot_filtering instances/instance_2000_8_30_10.json 600 66 66 0.2 0.1 8 false false true |& tee runs/instance_2000_8_30_10/8_0.2_0.1/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/8_0.2_0.1/std instances/instance_2000_8_30_10.json 600 66 66 0.2 0.1 8 false false false |& tee runs/instance_2000_8_30_10/8_0.2_0.1/std/log
mkdir -p {OD}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/8_0.4_0.4/building_and_lot_filtering instances/instance_2000_8_30_10.json 600 85 85 0.4 0.4 8 false true true |& tee runs/instance_2000_8_30_10/8_0.4_0.4/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/8_0.4_0.4/lot_filtering instances/instance_2000_8_30_10.json 600 85 85 0.4 0.4 8 false false true |& tee runs/instance_2000_8_30_10/8_0.4_0.4/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/8_0.4_0.4/std instances/instance_2000_8_30_10.json 600 85 85 0.4 0.4 8 false false false |& tee runs/instance_2000_8_30_10/8_0.4_0.4/std/log
