import System
import System.Linq.Enumerable
import System.Collections.Generic
import EulerTools from boot

primes = PrimeNumbers()

answer = 0
a,b,c,d = (0, 1, 1, 1)

while(true):
	answer++
	a,b,c,d = (b,c,d,primes.Factorize(answer+3).Distinct().Count())
	if (a==4 and b==4 and c==4 and d==4):
		break

print answer
assert answer == 134043