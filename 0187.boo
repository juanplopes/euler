/*
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers(5e7).Cache.ToList()
T = array(bool, 1e8)
print 'hi'
answer = 0
for i in range(primes.Count):
    if primes[i] >= 1e4: break
    for j in range(i, primes.Count):
        v = primes[i] * primes[j]
        if v >= 1e8: break
        if T[v]: continue
        T[v] = true
        answer++
    
print answer
assert answer == 17427258