import System
import System.Linq.Enumerable
import EulerTools from boot

primes = PrimeNumbers()

answer = primes.Limit(2000000).Select(Convert.ToInt64).Sum()

print answer
assert answer == 142913828922