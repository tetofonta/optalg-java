
set -x
mvn clean package -D skipTests
export LD_LIBRARY_PATH=$PWD/gurobi1003/linux64/lib
CP="target/classes:target/lib/*:$PWD/gurobi1003/linux64/lib/gurobi.jar"


mkdir -p runs/instance_2000_8_30_8/4_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.2_0.1_overlapped/building_and_lot_filtering instances/instance_2000_8_30_8.json 600 18 18 0.2 0.1 4 true true true |& tee runs/instance_2000_8_30_8/4_0.2_0.1_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.2_0.1_overlapped/lot_filtering instances/instance_2000_8_30_8.json 600 18 18 0.2 0.1 4 true false true |& tee runs/instance_2000_8_30_8/4_0.2_0.1_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.2_0.1_overlapped/std instances/instance_2000_8_30_8.json 600 18 18 0.2 0.1 4 true false false |& tee runs/instance_2000_8_30_8/4_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_2000_8_30_8/4_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.4_0.3_overlapped/building_and_lot_filtering instances/instance_2000_8_30_8.json 600 75 75 0.4 0.3 4 true true true |& tee runs/instance_2000_8_30_8/4_0.4_0.3_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.4_0.3_overlapped/lot_filtering instances/instance_2000_8_30_8.json 600 75 75 0.4 0.3 4 true false true |& tee runs/instance_2000_8_30_8/4_0.4_0.3_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/4_0.4_0.3_overlapped/std instances/instance_2000_8_30_8.json 600 75 75 0.4 0.3 4 true false false |& tee runs/instance_2000_8_30_8/4_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_2000_8_30_8/8_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/8_0.2_0.1_overlapped/std instances/instance_2000_8_30_8.json 600 37 37 0.2 0.1 8 true false false |& tee runs/instance_2000_8_30_8/8_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_2000_8_30_8/8_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_8/8_0.4_0.3_overlapped/std instances/instance_2000_8_30_8.json 600 150 150 0.4 0.3 8 true false false |& tee runs/instance_2000_8_30_8/8_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_7500_15_30_12/8_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.2_0.1_overlapped/building_and_lot_filtering instances/instance_7500_15_30_12.json 600 18 18 0.2 0.1 8 true true true |& tee runs/instance_7500_15_30_12/8_0.2_0.1_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.2_0.1_overlapped/lot_filtering instances/instance_7500_15_30_12.json 600 18 18 0.2 0.1 8 true false true |& tee runs/instance_7500_15_30_12/8_0.2_0.1_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.2_0.1_overlapped/std instances/instance_7500_15_30_12.json 600 18 18 0.2 0.1 8 true false false |& tee runs/instance_7500_15_30_12/8_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_7500_15_30_12/8_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.4_0.3_overlapped/building_and_lot_filtering instances/instance_7500_15_30_12.json 600 75 75 0.4 0.3 8 true true true |& tee runs/instance_7500_15_30_12/8_0.4_0.3_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.4_0.3_overlapped/lot_filtering instances/instance_7500_15_30_12.json 600 75 75 0.4 0.3 8 true false true |& tee runs/instance_7500_15_30_12/8_0.4_0.3_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/8_0.4_0.3_overlapped/std instances/instance_7500_15_30_12.json 600 75 75 0.4 0.3 8 true false false |& tee runs/instance_7500_15_30_12/8_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_7500_15_30_12/15_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/15_0.2_0.1_overlapped/std instances/instance_7500_15_30_12.json 600 37 37 0.2 0.1 15 true false false |& tee runs/instance_7500_15_30_12/15_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_7500_15_30_12/15_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_12/15_0.4_0.3_overlapped/std instances/instance_7500_15_30_12.json 600 150 150 0.4 0.3 15 true false false |& tee runs/instance_7500_15_30_12/15_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_500_5_30_12/3_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.2_0.1_overlapped/building_and_lot_filtering instances/instance_500_5_30_12.json 600 18 18 0.2 0.1 3 true true true |& tee runs/instance_500_5_30_12/3_0.2_0.1_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.2_0.1_overlapped/lot_filtering instances/instance_500_5_30_12.json 600 18 18 0.2 0.1 3 true false true |& tee runs/instance_500_5_30_12/3_0.2_0.1_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.2_0.1_overlapped/std instances/instance_500_5_30_12.json 600 18 18 0.2 0.1 3 true false false |& tee runs/instance_500_5_30_12/3_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_500_5_30_12/3_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.4_0.3_overlapped/building_and_lot_filtering instances/instance_500_5_30_12.json 600 75 75 0.4 0.3 3 true true true |& tee runs/instance_500_5_30_12/3_0.4_0.3_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.4_0.3_overlapped/lot_filtering instances/instance_500_5_30_12.json 600 75 75 0.4 0.3 3 true false true |& tee runs/instance_500_5_30_12/3_0.4_0.3_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/3_0.4_0.3_overlapped/std instances/instance_500_5_30_12.json 600 75 75 0.4 0.3 3 true false false |& tee runs/instance_500_5_30_12/3_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_500_5_30_12/5_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/5_0.2_0.1_overlapped/std instances/instance_500_5_30_12.json 600 37 37 0.2 0.1 5 true false false |& tee runs/instance_500_5_30_12/5_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_500_5_30_12/5_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_12/5_0.4_0.3_overlapped/std instances/instance_500_5_30_12.json 600 150 150 0.4 0.3 5 true false false |& tee runs/instance_500_5_30_12/5_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_7500_15_30_8/8_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.2_0.1_overlapped/building_and_lot_filtering instances/instance_7500_15_30_8.json 600 18 18 0.2 0.1 8 true true true |& tee runs/instance_7500_15_30_8/8_0.2_0.1_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.2_0.1_overlapped/lot_filtering instances/instance_7500_15_30_8.json 600 18 18 0.2 0.1 8 true false true |& tee runs/instance_7500_15_30_8/8_0.2_0.1_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.2_0.1_overlapped/std instances/instance_7500_15_30_8.json 600 18 18 0.2 0.1 8 true false false |& tee runs/instance_7500_15_30_8/8_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_7500_15_30_8/8_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.4_0.3_overlapped/building_and_lot_filtering instances/instance_7500_15_30_8.json 600 75 75 0.4 0.3 8 true true true |& tee runs/instance_7500_15_30_8/8_0.4_0.3_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.4_0.3_overlapped/lot_filtering instances/instance_7500_15_30_8.json 600 75 75 0.4 0.3 8 true false true |& tee runs/instance_7500_15_30_8/8_0.4_0.3_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/8_0.4_0.3_overlapped/std instances/instance_7500_15_30_8.json 600 75 75 0.4 0.3 8 true false false |& tee runs/instance_7500_15_30_8/8_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_7500_15_30_8/15_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/15_0.2_0.1_overlapped/std instances/instance_7500_15_30_8.json 600 37 37 0.2 0.1 15 true false false |& tee runs/instance_7500_15_30_8/15_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_7500_15_30_8/15_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_8/15_0.4_0.3_overlapped/std instances/instance_7500_15_30_8.json 600 150 150 0.4 0.3 15 true false false |& tee runs/instance_7500_15_30_8/15_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_2000_8_30_12/4_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.2_0.1_overlapped/building_and_lot_filtering instances/instance_2000_8_30_12.json 600 18 18 0.2 0.1 4 true true true |& tee runs/instance_2000_8_30_12/4_0.2_0.1_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.2_0.1_overlapped/lot_filtering instances/instance_2000_8_30_12.json 600 18 18 0.2 0.1 4 true false true |& tee runs/instance_2000_8_30_12/4_0.2_0.1_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.2_0.1_overlapped/std instances/instance_2000_8_30_12.json 600 18 18 0.2 0.1 4 true false false |& tee runs/instance_2000_8_30_12/4_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_2000_8_30_12/4_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.4_0.3_overlapped/building_and_lot_filtering instances/instance_2000_8_30_12.json 600 75 75 0.4 0.3 4 true true true |& tee runs/instance_2000_8_30_12/4_0.4_0.3_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.4_0.3_overlapped/lot_filtering instances/instance_2000_8_30_12.json 600 75 75 0.4 0.3 4 true false true |& tee runs/instance_2000_8_30_12/4_0.4_0.3_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/4_0.4_0.3_overlapped/std instances/instance_2000_8_30_12.json 600 75 75 0.4 0.3 4 true false false |& tee runs/instance_2000_8_30_12/4_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_2000_8_30_12/8_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/8_0.2_0.1_overlapped/std instances/instance_2000_8_30_12.json 600 37 37 0.2 0.1 8 true false false |& tee runs/instance_2000_8_30_12/8_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_2000_8_30_12/8_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_12/8_0.4_0.3_overlapped/std instances/instance_2000_8_30_12.json 600 150 150 0.4 0.3 8 true false false |& tee runs/instance_2000_8_30_12/8_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_500_5_30_8/3_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.2_0.1_overlapped/building_and_lot_filtering instances/instance_500_5_30_8.json 600 18 18 0.2 0.1 3 true true true |& tee runs/instance_500_5_30_8/3_0.2_0.1_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.2_0.1_overlapped/lot_filtering instances/instance_500_5_30_8.json 600 18 18 0.2 0.1 3 true false true |& tee runs/instance_500_5_30_8/3_0.2_0.1_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.2_0.1_overlapped/std instances/instance_500_5_30_8.json 600 18 18 0.2 0.1 3 true false false |& tee runs/instance_500_5_30_8/3_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_500_5_30_8/3_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.4_0.3_overlapped/building_and_lot_filtering instances/instance_500_5_30_8.json 600 75 75 0.4 0.3 3 true true true |& tee runs/instance_500_5_30_8/3_0.4_0.3_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.4_0.3_overlapped/lot_filtering instances/instance_500_5_30_8.json 600 75 75 0.4 0.3 3 true false true |& tee runs/instance_500_5_30_8/3_0.4_0.3_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/3_0.4_0.3_overlapped/std instances/instance_500_5_30_8.json 600 75 75 0.4 0.3 3 true false false |& tee runs/instance_500_5_30_8/3_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_500_5_30_8/5_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/5_0.2_0.1_overlapped/std instances/instance_500_5_30_8.json 600 37 37 0.2 0.1 5 true false false |& tee runs/instance_500_5_30_8/5_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_500_5_30_8/5_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_8/5_0.4_0.3_overlapped/std instances/instance_500_5_30_8.json 600 150 150 0.4 0.3 5 true false false |& tee runs/instance_500_5_30_8/5_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_500_5_30_10/3_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.2_0.1_overlapped/building_and_lot_filtering instances/instance_500_5_30_10.json 600 18 18 0.2 0.1 3 true true true |& tee runs/instance_500_5_30_10/3_0.2_0.1_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.2_0.1_overlapped/lot_filtering instances/instance_500_5_30_10.json 600 18 18 0.2 0.1 3 true false true |& tee runs/instance_500_5_30_10/3_0.2_0.1_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.2_0.1_overlapped/std instances/instance_500_5_30_10.json 600 18 18 0.2 0.1 3 true false false |& tee runs/instance_500_5_30_10/3_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_500_5_30_10/3_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.4_0.3_overlapped/building_and_lot_filtering instances/instance_500_5_30_10.json 600 75 75 0.4 0.3 3 true true true |& tee runs/instance_500_5_30_10/3_0.4_0.3_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.4_0.3_overlapped/lot_filtering instances/instance_500_5_30_10.json 600 75 75 0.4 0.3 3 true false true |& tee runs/instance_500_5_30_10/3_0.4_0.3_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/3_0.4_0.3_overlapped/std instances/instance_500_5_30_10.json 600 75 75 0.4 0.3 3 true false false |& tee runs/instance_500_5_30_10/3_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_500_5_30_10/5_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/5_0.2_0.1_overlapped/std instances/instance_500_5_30_10.json 600 37 37 0.2 0.1 5 true false false |& tee runs/instance_500_5_30_10/5_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_500_5_30_10/5_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_500_5_30_10/5_0.4_0.3_overlapped/std instances/instance_500_5_30_10.json 600 150 150 0.4 0.3 5 true false false |& tee runs/instance_500_5_30_10/5_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_7500_15_30_10/8_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.2_0.1_overlapped/building_and_lot_filtering instances/instance_7500_15_30_10.json 600 18 18 0.2 0.1 8 true true true |& tee runs/instance_7500_15_30_10/8_0.2_0.1_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.2_0.1_overlapped/lot_filtering instances/instance_7500_15_30_10.json 600 18 18 0.2 0.1 8 true false true |& tee runs/instance_7500_15_30_10/8_0.2_0.1_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.2_0.1_overlapped/std instances/instance_7500_15_30_10.json 600 18 18 0.2 0.1 8 true false false |& tee runs/instance_7500_15_30_10/8_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_7500_15_30_10/8_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.4_0.3_overlapped/building_and_lot_filtering instances/instance_7500_15_30_10.json 600 75 75 0.4 0.3 8 true true true |& tee runs/instance_7500_15_30_10/8_0.4_0.3_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.4_0.3_overlapped/lot_filtering instances/instance_7500_15_30_10.json 600 75 75 0.4 0.3 8 true false true |& tee runs/instance_7500_15_30_10/8_0.4_0.3_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/8_0.4_0.3_overlapped/std instances/instance_7500_15_30_10.json 600 75 75 0.4 0.3 8 true false false |& tee runs/instance_7500_15_30_10/8_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_7500_15_30_10/15_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/15_0.2_0.1_overlapped/std instances/instance_7500_15_30_10.json 600 37 37 0.2 0.1 15 true false false |& tee runs/instance_7500_15_30_10/15_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_7500_15_30_10/15_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_7500_15_30_10/15_0.4_0.3_overlapped/std instances/instance_7500_15_30_10.json 600 150 150 0.4 0.3 15 true false false |& tee runs/instance_7500_15_30_10/15_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_2000_8_30_10/4_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.2_0.1_overlapped/building_and_lot_filtering instances/instance_2000_8_30_10.json 600 18 18 0.2 0.1 4 true true true |& tee runs/instance_2000_8_30_10/4_0.2_0.1_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.2_0.1_overlapped/lot_filtering instances/instance_2000_8_30_10.json 600 18 18 0.2 0.1 4 true false true |& tee runs/instance_2000_8_30_10/4_0.2_0.1_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.2_0.1_overlapped/std instances/instance_2000_8_30_10.json 600 18 18 0.2 0.1 4 true false false |& tee runs/instance_2000_8_30_10/4_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_2000_8_30_10/4_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.4_0.3_overlapped/building_and_lot_filtering instances/instance_2000_8_30_10.json 600 75 75 0.4 0.3 4 true true true |& tee runs/instance_2000_8_30_10/4_0.4_0.3_overlapped/building_and_lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.4_0.3_overlapped/lot_filtering instances/instance_2000_8_30_10.json 600 75 75 0.4 0.3 4 true false true |& tee runs/instance_2000_8_30_10/4_0.4_0.3_overlapped/lot_filtering/log
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/4_0.4_0.3_overlapped/std instances/instance_2000_8_30_10.json 600 75 75 0.4 0.3 4 true false false |& tee runs/instance_2000_8_30_10/4_0.4_0.3_overlapped/std/log
mkdir -p runs/instance_2000_8_30_10/8_0.2_0.1_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/8_0.2_0.1_overlapped/std instances/instance_2000_8_30_10.json 600 37 37 0.2 0.1 8 true false false |& tee runs/instance_2000_8_30_10/8_0.2_0.1_overlapped/std/log
mkdir -p runs/instance_2000_8_30_10/8_0.4_0.3_overlapped/{building_and_lot_filtering,lot_filtering,std}
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint runs/instance_2000_8_30_10/8_0.4_0.3_overlapped/std instances/instance_2000_8_30_10.json 600 150 150 0.4 0.3 8 true false false |& tee runs/instance_2000_8_30_10/8_0.4_0.3_overlapped/std/log
