import System
import System.Linq.Enumerable
import EulerTools from boot

primes = PrimeNumbers(2e6)

answer = primes.Limit(2e6).Select(Convert.ToInt64).Sum()

print answer
assert answer == 142913828922