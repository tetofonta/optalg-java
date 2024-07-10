import glob
import re
import os
import math
import statistics

REF = {
    ("500", "5", "30", "8"): 85791,
    ("500", "5", "30", "10"): 85679,
    ("500", "5", "30", "12"): 85548,
    ("2000", "8", "30", "8"): 337312,
    ("2000", "8", "30", "10"): 333908,
    ("2000", "8", "30", "12"): 330462,
    ("7500", "15", "30", "8"): 1118421,
    ("7500", "15", "30", "10"): 1102267,
    ("7500", "15", "30", "12"): 1093855,
}

rep = []

def get_sol_and_time(f):
    try:
        with open(f, "r") as fl:
            sol = 0
            tim = 0
            l = fl.readline() 
            while l != '':
                if l.startswith("SOL VAL"):
                    sol = float(re.search(r"SOL VAL ([0-9\.]+) OK true", l).groups()[0])
                elif l.startswith("Took"):
                    tim = float(re.search(r"Took ([0-9]+)s", l).groups()[0])
                l = fl.readline() 
        return int(sol), int(tim)
    except:
        return 0, 0
        
def get_final_ksize(b, f):
    try:
        models = glob.glob(f.replace("log", "/models/kernel_solve_it_*"))
        models.sort()
        f = models[-1]
        with open(f, "r") as fl:
            l = fl.readline()
            while l != 'Bounds\n':
                l = fl.readline()
            i = b
            while l != 'Binaries\n':
                l = fl.readline()
                i -= 1
        return i
    except:
        return 0
    
    
def print_entry(p, bld, lots, loc, glb, lit, ks, bs, ovl, a, b):
    global rep
    if os.path.exists(p):
        s, t = get_sol_and_time(p)
        gap = "{:.2f}".format((REF[(bld, lots, loc, glb)] - s)/REF[(bld, lots, loc, glb)] * 100)
        fks = get_final_ksize(int(bld), p)
        rep.append((bld, lots, loc, glb, ks, bs, lit, ovl, a, b, str(s), str(gap), str(t), str(fks)))    


for inst in glob.glob("./runs/instance_*"):
    bld, lots, loc, glb = re.search(r"instance_([0-9]+)_([0-9]+)_([0-9]+)_([0-9]+)", inst).groups()
    for params in glob.glob(inst + "/*"):
        lit, ks, bs = re.search(r"([0-9]+)_([0-9\.]+)_([0-9\.]+).*", params.replace(inst, "")).groups()
        ovl = 'Y' if params.endswith("_overlapped") else 'N'

        print_entry(params + "/building_and_lot_filtering/log", bld, lots, loc, glb, lit, ks, bs, ovl, 'Y', 'Y')
        print_entry(params + "/lot_filtering/log", bld, lots, loc, glb, lit, ks, bs, ovl, 'Y', 'N')
        print_entry(params + "/std/log", bld, lots, loc, glb, lit, ks, bs, ovl, 'N', 'N')
    
spread = {}    
kdiff = {}    
rep.sort(key=lambda x: (*list(map(float, x[:7])), float(x[11])))
for x in rep:
    if x[:4] not in spread:
        spread[x[:4]] = []
    spread[x[:4]].append(x[10])
    
    if x[:8] not in kdiff:
        kdiff[x[:8]] = [0, 0]
    if x[8] == 'N' and x[9] == 'N':
        kdiff[x[:8]][0] = int(x[13])
    if x[8] == 'Y' and x[9] == 'Y':
        kdiff[x[:8]][1] = int(x[13])
    
    print(" & ".join(x) + "\\\\")
    

print("x;instance;value")
delta = []
xx = 0
for k, v in spread.items():
    for x in v:
        print(f"{xx};{'_'.join(k)};{round(float(x)/REF[k]*10000)/100}")
        if float(x) != 0:
            delta.append(round(float(x)/REF[k]*10000)/100)
    xx += 1
    
print("instance;min;max;diff")
for k, v in kdiff.items():
    print(f"{'_'.join(k)};{v[0]};{v[1]};{v[1]-v[0]}")
   
delta.sort(reverse=True)
print(delta)
print(statistics.fmean(delta))
print(statistics.stdev(delta))
print(statistics.stdev(delta))
delta.sort()
percentiles = statistics.quantiles(delta, n=100)
print(percentiles[9], percentiles[5], percentiles[1])
    
