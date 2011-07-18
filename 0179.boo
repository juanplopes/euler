/*
Simple sieve to sum all the divisors for each value. Only computes divisors 
up to sqrt(L), because of the pairity of the divisors.

Then 
*/
import System
import System.Linq.Enumerable

L = 1e7
D = array(short, L)
for i as long in range(1,cast(int, Math.Sqrt(L))):
    D[i*i] += 1
    for j in range(i*i+i, L, i):
        D[j] += 2

answer = 0
for i in range(1,L-1):        
    if (D[i] == D[i+1]): 
        answer+=1
    
print answer
assert answer == 986262