import System
import System.Linq.Enumerable
import EulerTools from boot

primes = PrimeNumbers()

def phi(n as int):
	factors = primes.Factorize(n).GroupBy({x|(x)})
	r as long = 1
	for g in factors:
		km1 = Math.Pow(g.Key, g.Count()-1)
		r *= (km1 * g.Key) - km1
	return r

answer = range(1e6+1).Select(phi).Sum()
print answer
assert answer == 303963552391