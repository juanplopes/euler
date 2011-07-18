/*
TODO (will be modified)
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()

def S(n as int):
    factors = primes.Factorize(n).GroupBy({x|(x)})
    r = 1
    for g in factors:
        r *= (g.Count() * 2 + 1)
    return r/2+1

answer = range(int.MaxValue).First({x as int|S(x) > 1000})
print answer
assert answer == 180180