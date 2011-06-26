import System
import System.Linq.Enumerable
import System.Collections.Generic
import EulerTools from boot

primes = PrimeNumbers(1e6)
cache = primes.Limit(1e6).ToArray()
sum = array(long, cache.Length+1)
sum[0] = 0

for i in range(1,cache.Length+1):
	sum[i] = sum[i-1] + cache[i-1]

max = 0
for i in range(sum.Length):
	if i+max >= sum.Length: continue
	for j in range(i+max, sum.Length):
		k = sum[j] - sum[i]
		if k>=1e6: break
		if primes.IsPrime(k) and j-i+1 > max:
			max = j-i+1
			answer = k

print answer
assert answer == 997651