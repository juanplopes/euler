import System.Linq.Enumerable
import EulerTools from boot

primes = PrimeNumbers()
required = (2, 2, 2, 2, 3, 3, 5, 7, 11, 13, 17, 19) 

def is_magical(x as int):
	for i in required:
		if (x%i>0): return false
		x/=i
	return true

answer = range(1, int.MaxValue).First(is_magical)

print answer
assert answer == 232792560