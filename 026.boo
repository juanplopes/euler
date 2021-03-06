/*
Solves by doing successive divisions method and finding the recurring cycle when
the remaining is 0 or 1.

Tests only primes (that doesn't have fixed part in dizim).
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()

def rec(d as int):
    r = 1
    c = 0
    while(true):
        while(r<d): r*=10
        c+=1
        r = r % d
        break if r in (0,1)
    return c

max = 0
for i in primes.Until(999):
    r = rec(i)
    if (r > max):
        max = r
        answer = i
    
print answer
assert answer == 983