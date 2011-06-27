import System
import System.Linq.Enumerable
import EulerTools from boot

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