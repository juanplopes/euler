import System
import System.Linq.Enumerable
import EulerTools from boot

L = 1.5e6+1
SL = cast(int, Math.Sqrt(L))
T = array(int, L)

def gcd(a as int, b as int):
	while(b): a, b = (b, a%b)
	return a;

answer = 0
for m in range(1, SL):
	for n in range(m+1, SL):
		if (n+m)%2 != 1 or gcd(m,n) != 1: continue
		a,b,c = (n*n-m*m, 2*m*n, n*n+m*m)
		if a+b+c >= L: break
		
		ka,kb,kc = 0,0,0
		for k in range(1,L):
			ka, kb, kc = (ka+a,kb+b,kc+c)
			if ka+kb+kc >= L: break
			d = ++T[ka+kb+kc]
			if d==1: answer+=1
			elif d==2: answer-=1

		
print answer
assert answer == 161667