/*
The minimum possible totient, relative to a number n is composed by the product
of the smallest possibile non-repeated primes. So, it's just a matter of 
multiplying them until it reaches 1e6.
*/
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