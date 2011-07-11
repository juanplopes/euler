import System
import System.Linq.Enumerable

primes = PrimeNumbers()

max = 0
for a in range(-1000, 1000):
	for b in range(-1000, 1000):
		n = range(int.MaxValue).TakeWhile({n as long|return n*n+a*n+b > 0 and primes.IsPrime(n*n+a*n+b)}).Count()

		if (n>max):
			max = n
			answer = a*b
			
print answer
assert answer == -59231