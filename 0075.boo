import System
import System.Linq.Enumerable
import EulerTools from boot

L = 1.5e6+1
SL = cast(int, Math.Sqrt(L)) +1
T = array(int, L)
primes = PrimeNumbers()

def gcd(a as int, b as int):
	while(b): a, b = (b, a%b)
	return a;

for m in range(1, SL):
	for n in range(m+1, SL):
		if (n&1!=0 and m&1!=0) or gcd(m,n) != 1: continue
		a as long = n*n - m*m
		b as long = 2*m*n
		c as long = n*n + m*m
		if a+b+c >= L: break
		for k in range(1,L):
			ka, kb, kc = (k*a,k*b,k*c)
			if ka+kb+kc >= L: break
			T[ka+kb+kc]++

		
answer = range(L).Count({x as int|T[x]==1})
print answer
assert answer == 161667