/*
Classic integer partition recurrence, modified for only using prime numbers. 
Uses memoization.

p(n,m) means in how many ways can we partition "n" using at most the factor "m".

The only difference to the classic algorithm is that we only consider prime
numbers as being valid factors.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()
T = matrix(int, 101, 101)

def sum(n as int, m as int) as int:
    if (n<0): return 0
    if (n==0): return 1
    if (T[n,m]!=0): return T[n,m]

    for i in primes.Until(m):
        T[n,m] = T[n,m] + sum(n-i, i)
        
    return T[n,m]
    
answer = range(1,int.MaxValue).First({x as int|sum(x,x) > 5000})
print answer
assert answer == 71