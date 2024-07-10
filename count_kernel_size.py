import re

DIR = "runs/instance_7500_15_30_12/8_0.2_0.1_overlapped/std/models/"
ITS = 2
BPI = 16

def get_var_from_file(f):
    v = set(range(0, 7500))
    with open(DIR + f, "r") as model:
        line = model.readline()
        while line != "Bounds\n":
            line = model.readline()
        while line != "Binaries\n":
            line = model.readline()
            val = re.search(r" building_([0-9]+) = 0", line)
            if val:
                v.remove(int(val.groups()[0]))
    return v
            

for it in range(ITS):
    ks = len(get_var_from_file(f"kernel_solve_it_{it}.lp"))
    delta = 0
    print("K", ks)
    for b in range(BPI):
        d = len(get_var_from_file(f"kernel_solve_it_{it}_bucket_{b}.lp"))
        if b == 0:
            delta = d - ks
        print(d - delta)
