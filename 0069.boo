import System
import System.Linq.Enumerable

primes = PrimeNumbers()

#to minimize totient, must have all smaller primes

answer = 1
for i in primes:
	if (answer*i > 1e6): break
	answer *= i
	
print answer
assert answer == 510510