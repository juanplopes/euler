import System
import System.Linq.Enumerable
	
P = array(int, 1000)
for i in range(1, P.Length / 2):
	P[2*i-2] = i*(3*i-1)/2
	P[2*i-1] = -i*(-3*i-1)/2

T = array(int, 1e5)

T[0] = 1
answer = 0
for answer in range(1, T.Length):
	s, j = 0, 0

	while P[j] <= answer:
		s = (s + (1 if j%4<2 else -1) * T[answer-P[j]]) % 1e6
		j++
		
	if s==0: break
	T[answer] = s
		
print answer
assert answer == 55374