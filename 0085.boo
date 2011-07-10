import System
import System.Linq.Enumerable
import EulerTools from boot

T = array(long, 2000)
T[0] = 0
for i in range(1, 2000):
	T[i] = T[i-1] + i

	
min = 2e6
for i in range(2000):
	for j in range(2000):
		if T[i]*T[j] > 2e6+min: break
		
		x = Math.Abs(T[i]*T[j]-2e6)
		if x < min:
			min = x
			answer = i*j
	

print answer
assert answer == 2772