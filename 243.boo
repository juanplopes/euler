/*
First, we find the least highly composite number that is less than the required
fraction. It is something like
2 x 3 x 5 x 7 x 11 ...

If we add the next prime, it would be a valid number, but not necessarily the 
minimum. Then we try every possible factor (not only primes) up to the next 
prime to find the minimum composite number that satisfies the condition.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()
P = primes.Take(50).ToArray()
L = 15499/94744.0
d, next = 1L, 1L

def phi(n as long) as long:
    factors = primes.Factorize(n).GroupBy({x|(x)})
    res = 1
    for f in factors.Select({x|x.Key**x.Count()*(1-1.0/x.Key)}):
        res *= f
    return res

def resilience(n as long) as double:
    return phi(n)/(n-1.0)
    
for p in P:
    next = p
    if resilience(d*p) < L: 
        break
    d *= p

for i in range(2,next+1):
    if resilience(d*i) < L: 
        answer = d*i
        break
    
print answer
assert answer == 892371480
