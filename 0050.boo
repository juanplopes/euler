import System
import System.Linq.Enumerable
import System.Collections.Generic
import EulerTools from boot

prime_numbers = PrimeNumbers()
primes = prime_numbers.Limit(1e6).ToArray()
sum = array(long, primes.Length+1)
sum[0] = 0
for i in range(1,primes.Length+1):
	sum[i] = sum[i-1] + primes[i-1]

max = 0
for i in range(sum.Length):
	for j in range(i+1, sum.Length):
		k = sum[j] - sum[i]
		if k < 1e6 and prime_numbers.IsPrime(k) and j-i+1 > max:
			max = j-i+1
			answer = k

print answer
assert answer == 997651