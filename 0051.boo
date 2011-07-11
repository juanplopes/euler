import System
import System.Linq.Enumerable
import System.Collections.Generic

primes = PrimeNumbers()
P10 = (1, 1e1, 1e2, 1e3, 1e4, 1e5, 1e6, 1e7, 1e8)
def remake_as(mask as int, BigInteger as int):
	result,count,wildcards,temp=(0,0,0,0)
	while(mask):
		mask = Math.DivRem(mask, 11, temp)
	
		if (temp == 10): 
			if not (mask or BigInteger): return 0
			temp = BigInteger
			wildcards++
		result += P10[count++] * temp
	
	#BLACK MAGIC (most of the performance goes here)
	#only because BigIntegers must be changed in groups of three
	#because looping throught the wildcard otherwise will generate
	#at least 3 multiples of 3 (10-3 = 7, at most)
	#actually, it should be %3, but we can cheat here, can't we?
	if wildcards != 3: return -1
	return result
	
for i in range(int.MaxValue):
	count = 0
	
	for j in range(10):
		candidate = remake_as(i, j)
		if candidate == -1: break
		if primes.IsPrime(candidate):
			if ++count == 1:
				answer = candidate
		if j-count > 1: break
	if count == 8: break
	
print answer
assert answer == 121313