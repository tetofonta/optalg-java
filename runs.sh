set -x

mvn clean package -D skipTests

export LD_LIBRARY_PATH=$PWD/gurobi1003/linux64/lib
CP="target/classes:target/lib/*:$PWD/gurobi1003/linux64/lib/gurobi.jar"


#java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_12.json 600 30 30 0.2 0.2 4 false true true |& tee instance_7500_15_30_12_600_30_0.2_4_f_t_t
#java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_12.json 600 30 30 0.2 0.2 4 false false false |& tee instance_7500_15_30_12_600_30_0.2_4_f_f_f
#java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_12.json 600 60 60 0.2 0.2 8 false true true |& tee instance_7500_15_30_12_600_60_0.2_8_f_t_t
#java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_12.json 600 60 60 0.2 0.2 8 false false false |& tee instance_7500_15_30_12_600_60_0.2_8_f_f_f
#java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_12.json 600 120 120 0.2 0.2 15 false false false |& tee instance_7500_15_30_12_600_120_0.2_15_f_f_f

java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_10.json 600 30 30 0.2 0.2 4 false true true |& tee instance_7500_15_30_10_600_30_0.2_4_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_10.json 600 30 30 0.2 0.2 4 false false false |& tee instance_7500_15_30_10_600_30_0.2_4_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_10.json 600 60 60 0.2 0.2 8 false true true |& tee instance_7500_15_30_10_600_60_0.2_8_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_10.json 600 60 60 0.2 0.2 8 false false false |& tee instance_7500_15_30_10_600_60_0.2_8_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_10.json 600 120 120 0.2 0.2 15 false false false |& tee instance_7500_15_30_10_600_120_0.2_15_f_f_f

java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_8.json 600 30 30 0.2 0.2 4 false true true |& tee instance_7500_15_30_8_600_30_0.2_4_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_8.json 600 30 30 0.2 0.2 4 false false false |& tee instance_7500_15_30_8_600_30_0.2_4_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_8.json 600 60 60 0.2 0.2 8 false true true |& tee instance_7500_15_30_8_600_60_0.2_8_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_8.json 600 60 60 0.2 0.2 8 false false false |& tee instance_7500_15_30_8_600_60_0.2_8_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_7500_15_30_8.json 600 120 120 0.2 0.2 15 false false false |& tee instance_7500_15_30_8_600_120_0.2_15_f_f_f

java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_12.json 600 30 30 0.2 0.2 4 false true true |& tee instance_2000_15_30_12_600_30_0.2_4_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_12.json 600 30 30 0.2 0.2 4 false false false |& tee instance_2000_15_30_12_600_30_0.2_4_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_12.json 600 60 60 0.2 0.2 8 false true true |& tee instance_2000_15_30_12_600_60_0.2_8_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_12.json 600 60 60 0.2 0.2 8 false false false |& tee instance_2000_15_30_12_600_60_0.2_8_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_12.json 600 120 120 0.2 0.2 15 false false false |& tee instance_2000_15_30_12_600_120_0.2_15_f_f_f

java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_10.json 600 30 30 0.2 0.2 4 false true true |& tee instance_2000_15_30_10_600_30_0.2_4_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_10.json 600 30 30 0.2 0.2 4 false false false |& tee instance_2000_15_30_10_600_30_0.2_4_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_10.json 600 60 60 0.2 0.2 8 false true true |& tee instance_2000_15_30_10_600_60_0.2_8_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_10.json 600 60 60 0.2 0.2 8 false false false |& tee instance_2000_15_30_10_600_60_0.2_8_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_10.json 600 120 120 0.2 0.2 15 false false false |& tee instance_2000_15_30_10_600_120_0.2_15_f_f_f

java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_8.json 600 30 30 0.2 0.2 4 false true true |& tee instance_2000_15_30_8_600_30_0.2_4_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_8.json 600 30 30 0.2 0.2 4 false false false |& tee instance_2000_15_30_8_600_30_0.2_4_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_8.json 600 60 60 0.2 0.2 8 false true true |& tee instance_2000_15_30_8_600_60_0.2_8_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_8.json 600 60 60 0.2 0.2 8 false false false |& tee instance_2000_15_30_8_600_60_0.2_8_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_2000_15_30_8.json 600 120 120 0.2 0.2 15 false false false |& tee instance_2000_15_30_8_600_120_0.2_15_f_f_f

java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_12.json 600 30 30 0.2 0.2 4 false true true |& tee instance_500_15_30_12_600_30_0.2_4_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_12.json 600 30 30 0.2 0.2 4 false false false |& tee instance_500_15_30_12_600_30_0.2_4_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_12.json 600 60 60 0.2 0.2 8 false true true |& tee instance_500_15_30_12_600_60_0.2_8_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_12.json 600 60 60 0.2 0.2 8 false false false |& tee instance_500_15_30_12_600_60_0.2_8_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_12.json 600 120 120 0.2 0.2 15 false false false |& tee instance_500_15_30_12_600_120_0.2_15_f_f_f

java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_10.json 600 30 30 0.2 0.2 4 false true true |& tee instance_500_15_30_10_600_30_0.2_4_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_10.json 600 30 30 0.2 0.2 4 false false false |& tee instance_500_15_30_10_600_30_0.2_4_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_10.json 600 60 60 0.2 0.2 8 false true true |& tee instance_500_15_30_10_600_60_0.2_8_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_10.json 600 60 60 0.2 0.2 8 false false false |& tee instance_500_15_30_10_600_60_0.2_8_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_10.json 600 120 120 0.2 0.2 15 false false false |& tee instance_500_15_30_10_600_120_0.2_15_f_f_f

java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_8.json 600 30 30 0.2 0.2 4 false true true |& tee instance_500_15_30_8_600_30_0.2_4_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_8.json 600 30 30 0.2 0.2 4 false false false |& tee instance_500_15_30_8_600_30_0.2_4_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_8.json 600 60 60 0.2 0.2 8 false true true |& tee instance_500_15_30_8_600_60_0.2_8_f_t_t
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_8.json 600 60 60 0.2 0.2 8 false false false |& tee instance_500_15_30_8_600_60_0.2_8_f_f_f
java -cp "$CP" it.unibs.optalg.cmkp.EntryPoint . instances/instance_500_15_30_8.json 600 120 120 0.2 0.2 15 false false false |& tee instance_500_15_30_8_600_120_0.2_15_f_f_f

