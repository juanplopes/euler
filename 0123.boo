/*
TODO
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers(1e6).Cache.ToList()

for n in range(7038, primes.Count):
    p = BigInteger(primes[n-1])
    ns = p*p
    r = ((p-1).Pow(n, ns) + (p+1).Pow(n, ns)) % ns
    if r > 1e10: 
        answer = n
        break;

print answer
assert answer == 21035