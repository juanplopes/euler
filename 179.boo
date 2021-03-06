/*
Simple sieve to sum all the divisors for each value. Only computes divisors 
up to sqrt(L), because of the pairity of the divisors, sums in pairs, except for
squares, that only counts once.

Then the answer is found by searching for all computed values that meets the
criteria.
*/
import System
import System.Linq.Enumerable

L = 10**7
D = array(short, L)

D[1] = 1
for i in range(2,cast(int, Math.Sqrt(L))):
    D[i*i] += 1
    for j in range(i*i+i, L, i):
        D[j] += 2

answer = 0
for i in range(1,L):     
    if (D[i] == D[i-1]): 
        answer+=1
    
print answer
assert answer == 986262