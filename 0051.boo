import System
import System.Linq.Enumerable
import System.Collections.Generic
import EulerTools from boot

primes = PrimeNumbers()
D = (1, 1e1, 1e2, 1e3, 1e4, 1e5, 1e6, 1e7, 1e8)
def remake_as(number as int, new_number as int):
	r,c,temp=(0,0,0)
	while(number):
		number = Math.DivRem(number, 11, temp)
		if not number and temp==10 and new_number ==0: return 0
		if (temp == 10): temp = new_number
		r += D[c] * temp
		c+=1
	return r

for i in range(11, int.MaxValue):
	count = 0
	first_prime = 0
	#print remake_as(i, 9)
	for j in range(10):
		candidate = remake_as(i, j)
		if primes.IsPrime(candidate):
			#print ' ' + candidate
			count += 1
			if count == 1:
				first_prime = candidate
	if count == 8: break
	
answer = first_prime
print answer
assert answer == 121313