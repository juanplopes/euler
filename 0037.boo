/*
Decompose the number into its decimal digits and verify on the way if all stages
are prime. Do the same to the reverse of the reversed decompositon (got it?).

Just another brute force, by the way.
*/
import System
import System.Linq.Enumerable

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