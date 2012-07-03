/*
For the layer x (0-based) of an a,b,c cuboid, you need exactly cubes:

2(ab+ac+bc) + 4x(a+b+c-1) + 4x^2

Just try all (increasing) cube combination, pruning invalid ones, and all layers
accumulating in C the number of cubes of each layer.

*/
import System
import System.Math
import System.Linq.Enumerable

L = 18523
C = array(long, L)

for a as long in range(1, L):
    for b as long in range(a, L):
        if 2*a*b >= L: break
        for c as long in range(b, L):
            k = 2*(a*b+a*c+b*c)
            if k >= L: break
            kk = 4*(a+b+c-1)
            for x in range(L):
                n = k + x*kk + 4*x*x
                if n >= L:
                    break
                C[n] += 1


answer = range(L).First({n|C[n] == 1000})
print answer
assert answer == 18522
