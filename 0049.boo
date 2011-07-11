import System
import System.Linq.Enumerable
import System.Collections.Generic

primes = PrimeNumbers()

def same_digits(a as int, b as int):
	digits = array(int, 10)
	while(a>0): digits[a%10]++; a/=10
	while(b>0): digits[b%10]--; b/=10
	return digits.All({x|x==0})

def are_permutation(a as int, b as int, c as int):
	if not primes.IsPrime(a) or not primes.IsPrime(b) or not primes.IsPrime(c): return false
	return same_digits(a,b) and same_digits(b,c)

for a in range(1000, 10000-2*3330):
	if a==1487: continue
	b = a + 3330
	c = b + 3330
	if are_permutation(a, b, c):
		answer = ''+a+b+c
		break
print answer
assert answer == '296962999629'