/*
Clever backtrack. Try, for each digit backwards fixing number of required 
repetitions (tr).

Then backtrack in a way that you only generate numbers with the correct
ammout of repeated digits.
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

primes = PrimeNumbers(100000)

def backtrack(a as long, d as int, kn as int, kr as int, tn as int, tr as int) as long:
    if tn-kn-(tr-kr) == 0:
        while tr-kr:
            a = a*10+d
            kr+=1
        return (a if primes.IsPrime(a) else 0)
            
    res = 0L
    sa = a
    bound = (tr-kr+1 if kn>0 or d!=0 else 1)
    for i in range(bound):
        for j in range(10):
            if j==d: continue
            if sa==0 and j==0: continue
            res += backtrack(sa*10+j, d, kn+i+1, kr+i, tn, tr)
        sa = sa*10+d
    return res

answer = 0L
for i in range(10):
    for j in range(9, 0):
        b = backtrack(0, i, 0, 0, 10, j)
        if b: 
            answer += b
            break

print answer
assert answer == 612407567715
