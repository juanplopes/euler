"""
Almost brute force. Intelligent only to know that the best values for b are
primes, since prime numbers are coprimes to all numbers before them.
"""
import System
import System.Linq.Enumerable

primes = PrimeNumbers()

max = 0
for a in range(-1000, 1000):
	for b in primes.Until(999):
		n = range(int.MaxValue).TakeWhile({n as long|return n*n+a*n+b > 0 and primes.IsPrime(n*n+a*n+b)}).Count()
		if (n>max):
			max = n
			answer = a*b
			
print answer
assert answer == -59231