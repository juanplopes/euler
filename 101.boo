/*
Creates linear system and solve by gaussian elimination.

E.g.: to create a 4-term minimum polynomial for polynomial n^4, we have that:

a + bn + cn^2 + dn^3 = n^4, or

a +  b +   c +   d =   1
a + 2b +  4c +  8d =  16
a + 3b +  9c + 27d =  81
a + 4b + 16c + 64d = 256

We can, now solve this system by gaussian elimination and discover what are 
the coeficients a,b,c,d. All we have to do is make this process to all degrees
required by the problem.

Credits for the solution to Jacqueline Abreu (@JacAbreu).
*/
import System
import System.Linq.Enumerable

def poly(n as double):
    return 1.0 - n + n**2 - n**3 + n**4 - n**5 + n**6 - n**7 + n**8 - n**9 + n**10

def gauss(M as (double, 2)):
    n, m = len(M,0), len(M,1)
    for i in range(n):
        factor = M[i,i]
        for j in range(m):
            M[i,j] = M[i,j] / factor

        for k in range(n):
            if k==i: continue
            factor = M[k,i]            
            for j in range(m):
                M[k,j] = M[k,j] - M[i,j]*factor
        
    return range(n).Select({a|M[a,m-1]}).ToArray()

def create(i as double):
    M = matrix(double, i, i+1)
    for a as double in range(i):
        for b as double in range(i):
            M[a,b] = (a+1)**b
        M[a,i] = poly(a+1)
    return M

def apply(F as (double), n as double):
    res = 0.0
    for i in range(F.Length):
        res += F[i] * n**i
    return res

answer = 0.0
for i in range(1, 11):
    M = create(i)
    G = gauss(M)

    for n in range(1,int.MaxValue):
        v1 = poly(n)
        v2 = apply(G, n)
        if v1!=v2:
            answer += v2
            break
            
print answer
assert answer == 37076114526
