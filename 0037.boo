import System
import System.Linq.Enumerable
import EulerTools from boot

primes = PrimeNumbers()

def reverse(a as int):
	n = 0
	while(a != 0):
		n = n*10+a%10
		a/=10
	return n

def is_truncatable(a as int):
	n = 0
	while(a != 0):
		n = n*10+a%10
		a/=10
		if a != 0 and not primes.IsPrime(a): return false
		if not primes.IsPrime(reverse(n)):	return false
	return true

answer = range(10, int.MaxValue).Where(is_truncatable).Take(11).Sum()
		
print answer
assert answer == 748317