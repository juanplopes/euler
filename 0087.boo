/*
Basically brute force. Try all primes and use an array to keep track of what
sums were already created.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()
T = array(bool, 5e7)

answer = 0
for a in primes:
	n1 = a*a
	if n1 > 5e7: break
	for b in primes:
		n2 = n1+b*b*b
		if n2 > 5e7: break
		for c in primes:
			n = n2 + c*c*c*c
			if n>=5e7: break
			if not T[n]: answer+=1
			T[n] = true


print answer
assert answer == 1097343