import System
import System.Linq.Enumerable

def pentagonal():
	for i in range(1, int.MaxValue):
		yield i*(3*i-1)/2
		yield -i*(-3*i-1)/2

L = 1e5

T = array(int, L)
T[0] = 1
for i in range(1, L):
	s, sig, c = (0, 1, 0)
	for k in pentagonal().TakeWhile({x as int|x<=i}):
		s = (s + sig * T[i-k]) % 1e6
		if (++c==2): c, sig = 0, -sig
	if s==0: 
		answer = i
		break
	T[i] = s
		
print answer
assert answer == 55374