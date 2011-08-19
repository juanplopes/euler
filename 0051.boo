/*
Aims to generate all possible masks. So, design a base-11 number system, that
compreehends 0..9 and *. Iterate through all the numbers in that system, and
for each number, create all possible decimal representations (remake_as), 
replacing * by a number from 0..9. If a mask can generate 8 different primes
with calls to remake_as, then we found our answer.

Uses some black magic (see comment below).
*/
import System
import System.Linq.Enumerable
import System.Collections.Generic

primes = PrimeNumbers()
P10 = (1, 10**1, 10**2, 10**3, 10**4, 10**5, 10**6, 10**7, 10**8)
def remake_as(mask as int, number as int):
    result,count,wildcards,temp=(0,0,0,0)
    while(mask):
        mask = Math.DivRem(mask, 11, temp)
    
        if (temp == 10): 
            if not (mask or number): return 0
            temp = number
            wildcards++
        result += P10[count++] * temp
    
    #BLACK MAGIC (most of the performance goes here)
    #only because numbers must be changed in groups of three
    #because looping throught the wildcard otherwise will generate
    #at least 3 multiples of 3 (10-3 = 7, at most)
    #actually, it should be %3, but we can cheat here, can't we?
    if wildcards != 3: return -1
    return result
    
for i in range(int.MaxValue):
    count = 0
    
    for j in range(10):
        candidate = remake_as(i, j)
        if candidate == -1: break
        if primes.IsPrime(candidate):
            if ++count == 1:
                answer = candidate
        if j-count > 1: break #almost missed more than two, give up for this one
    if count == 8: break
    
print answer
assert answer == 121313