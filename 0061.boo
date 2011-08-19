/*
Well, that's hard to explain.

First, we simplify all the functions to its parameters. 
e.g. n(5n-3)/2 yields a=5, b=-2,c=2

With these parameters, we define generate and check functions. Each function 
type is defined by an index. 0 is triangle, 1 is square, etc.

Then we generate all possible permutations of the function indexes, allowing
to have any order of functions for the generated number. We only freezes the 
last as being 5 to avoid multiple solutions by cycling the permutations. And
to reduce execution time also.

Please note that only the first, third and fifth values are generated. The
others can be calculated by cycling them. To find a solution, it's just a matter
of testing if the cycled values are of the type of values they claim to be.
*/
import System
import System.Linq.Enumerable

formulae = ((1,1,2), (1,0,1), (3,-1,2), (2,-1,1), (5,-3,2), (3,-2,1))

def generate(f as int):
    a,b,c = formulae[f]
    for n in range(int.MaxValue):
        v = n*(a*n+b)/c
        if v >= 10**4: break
        if v >= 10**3 and v%100 > 9: yield v

def check(f as int, x as int):
    if x < 1000: return false
    a,b,c = formulae[f]
    n = (-b + Math.Sqrt(b*b + 4*a*c*x)) / (2.0*a)
    return cast(int, n) == n

def cycle(a as int, b as int):
    return a%100*100+b/100

def kth_permutation(n as int, k as int):
    data = array(int, n)
    for j in range(1, n+1):
        data[n-j] = (k % j)
        k /= j

    data[n-1] = 0
    for i in range(n-2, -1):
        for j in range(i+1, n):
            if data[j] >= data[i]: data[j] += 1
    return data
    
for k in range(5*4*3*2*1):
    a,b,c,d,e = kth_permutation(5, k)
    f = 5
    for va in generate(a):
        for vc in generate(c):
            vb = cycle(va,vc)
            if not check(b, vb): continue
            for ve in generate(e):
                vd = cycle(vc,ve)
                if not check(d, vd): continue
                vf = cycle(ve,va)
                if not check(f, vf): continue
                answer = va+vb+vc+vd+ve+vf
    
print answer
assert answer == 28684