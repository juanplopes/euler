import System
import System.Linq.Enumerable
import EulerTools from boot

primes = PrimeNumbers()


n, p = (1, 0)
for side in range(3, 100000, 2):
	for i in range(4):
		n += side-1
		if (primes.IsPrime(n)): p+=1
	if p/(2*side-1.0) < 0.1:
		answer = side
		break

print answer
assert answer == 26241