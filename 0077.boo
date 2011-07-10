import System
import System.Linq.Enumerable
import EulerTools from boot

primes = PrimeNumbers()
T = matrix(int, 101, 101)

def sum(n as int, m as int) as int:
	if (n<0): return 0
	if (n==0): return 1
	if (T[n,m]!=0): return T[n,m]

	for i in primes.Until(m):
		T[n,m] = T[n,m] + sum(n-i, i)
		
	return T[n,m]
	
answer = range(1,int.MaxValue).First({x as int|sum(x,x) > 5000})
print answer
assert answer == 71