/*
For each prime up to sqrt(1e8), find via binary search the first prime that,
multipied by the first, is greater than 1e8. Them sum the difference of indexes
to the answer. This is: the number of primes greater thant the current that
multiplied by the current is less thant 1e8.

Must improve.
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

primes = PrimeNumbers(1e8/2).Cache.ToList()

answer = 0
for i in range(primes.Count):
    if primes[i] >= 1e4: break
    target = 1e8/primes[i]
    
    j = primes.BinarySearch(target) +1
    if j <= 0: j = -j
   
    answer += j-i
    
print answer
assert answer == 17427258