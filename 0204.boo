/*
Brute force. 

Try all the multiplications of the allowed primes and count them.
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

L = 1000000000
P = PrimeNumbers().Until(100).ToArray()
PM = P.Select({x|L/x}).ToArray()

def backtrack(a as int, d as int) as int:
    res = 0
    for i in range(d, P.Length):
        if a <= PM[i]:
            res += 1 + backtrack(a*P[i], i)
    return res

answer = backtrack(1, 0)+1

print answer
assert answer == 2944730
