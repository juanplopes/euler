import System
import System.Linq.Enumerable
import EulerTools from boot

L = 10000

primes = PrimeNumbers()

is_int = {n as double| n==cast(int,n)}
is_twice_a_square = {n as int | is_int(Math.Sqrt(n/2.0)) }
TS = range(L).Select(is_twice_a_square).ToArray()

def isnot_goldbach(n as int):
	return not primes.Until(n).Any({p|TS[n-p]}) 

odd_composites = range(3, L, 2).Where({x|not primes.IsPrime(x)})
answer = odd_composites.First(isnot_goldbach)

print answer
assert answer == 5777