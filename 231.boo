/*
Fill primes sum using dynamic programing. Just:

If you know S[n] = k, you know also that
S[n*p] = k+p

Then you just need to sum the values.
*/
import System
import System.Linq.Enumerable

P = PrimeNumbers(20000000).Cache.ToArray()
S = array(int, 20000001)

def fill(v as long, s as int, k as int):
    S[v] = s
    for i in range(k, P.Length):
        if v*P[i] > 20000000: break
        fill(v*P[i], s+P[i], i)

fill(1, 0, 0)        
answer = 0L
for i in range(15000001, 20000001):
    answer += S[i]
for i in range(1, 5000001):
    answer -= S[i]
    
print answer
assert answer == 7526965179680L
