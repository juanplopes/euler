import System
import System.Linq.Enumerable
import System.Collections.Generic
import EulerTools from boot

primes = PrimeNumbers()

def to_dictionary(n as int):
	d = List[of int]()
	last = 1
	for g in primes.Factorize(n):
		if last == g: d[d.Count-1]*=g; last=g
		else: d.Add(g); last=g
	return d

F = range(134050).Select(to_dictionary).ToArray()

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