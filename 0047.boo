import System
import System.Linq.Enumerable
import System.Collections.Generic
import EulerTools from boot

primes = PrimeNumbers()

def to_dictionary(n as int):
	d = Dictionary[of int, int]()
	for g in primes.Factorize(n).GroupBy({k|return k}):
		d[g.Key] = g.Count()
		
	return d

F = range(200000).Select(to_dictionary).ToArray()	
def is_good(a as int):
	k = 4
	numbers = range(a, a+k).Select({n as int|F[n]}).ToArray()
	
	for n in numbers:
		for m in numbers:
			if n.Count != k or m.Count != k or (n!=m and n.Intersect(m).Any()): return false
	return true

answer = range(int.MaxValue).First(is_good)

print answer
assert answer == 134043