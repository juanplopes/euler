import System
import System.Linq.Enumerable
import EulerTools

def pentagonal():
	for i in range(1, int.MaxValue):
		yield i*(3*i-1)/2
		yield -i*(-3*i-1)/2

L = 1e6
P = pentagonal().TakeWhile({x|x<=L}).ToArray()

T = array(long, L)
T[0] = 1
for i in range(1, L):
	s = 0L
	sig = 1L
	c = 0L
	for k in P.TakeWhile({x as int|x<=i}):
		s += sig * T[i-k]
		if s>=1e6: s-=1e6
		if s<=-1e6: s+=1e6
		
		if (++c==2): c, sig = 0, -sig
	if s==0: 
		answer = i
		break
	T[i] = s
		
print answer
assert answer == 55374