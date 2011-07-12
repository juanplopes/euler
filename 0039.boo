/*
Generate all pythagorean triangles by using Euclid's formula.
I.e.: pick any n, m, n>m, coprime (gcd==1) and with one of them even.
a = n*n-m*m
b = 2*m*n
c = n*n+m*m

e.g. nm(1,2) => abc(3,4,5)

Generate all the derived triangles by multipling it by constant k, until it
overflows the target.

e.g. (3,4,5) => (6, 8, 10), (9, 12, 15) and so on...
*/
import System
import System.Linq.Enumerable

L = 1001
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

max = 0
for i in range(1, 1001):
	if (T[i] > max):
		max = T[i]
		answer = i

print answer
assert answer == 840