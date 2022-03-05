import subprocess
from sympy.ntheory import factorint


def cado_factor(n):
    output = subprocess.check_output(['python3', 'cado-nfs.py', str(n), '--screenlog', 'WARNING'])
    output = output.decode("utf-8")
    return sorted([int(i) for i in output.split()])


def prod(i):
    p = 1
    for e in i:
        p *= e
    return p


bignum = 17113636163329171307055067007779498398991498581710873599122232450394704

cado_factors = cado_factor(bignum)
remaining = bignum // prod(cado_factors)
factors = factorint(remaining)

for f in cado_factors:
    try:
        factors[f] += 1
    except KeyError:
        factors[f] = 1

print(factors == factorint(bignum))
