import System
import System.Linq.Enumerable

T = array(int, 1001)

for a as long in range(1, 1001):
	for p as long in range(a, 1001):
		if (p*2 - 2*a) == 0: continue
		b = (p*p-2*p*a) / (p*2.0 - 2.0*a)
		c = p-a-b
		is_int = b == cast(int, b) and c == cast(int, c)
		is_positive = b>0 and c>0 
		is_unique = a < b and b < c
		if is_int and is_positive and is_unique:
			T[p]+=1

max = 0
for i in range(1, 1001):
	if (T[i] > max):
		max = T[i]
		answer = i

print answer
assert answer == 840