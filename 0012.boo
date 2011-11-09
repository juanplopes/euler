/*
It is known that if a number can be primary decomposed as
n1^k1 * n2^k2 * ... * nq^kq
it has (k1+1)*(k2+1)*...*(kq+1) divisors.

This solution uses this property to find the number of divisors.
Then brute force.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()
def divisors_count(n as int):
    factors = primes.Factorize(n).GroupBy({x|(x)})
    r = 1
    for g in factors:
        r *= g.Count() + 1
    return r

triangles = range(1, int.MaxValue).Select({n as int|n*(n+1)/2})
has_five_hundred = {n as int|divisors_count(n) > 500}
answer = triangles.First(has_five_hundred)

print answer
assert answer == 76576500