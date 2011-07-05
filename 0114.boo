import System
import System.Linq.Enumerable

T = array(long, 51)

for i in range(0,3): T[i] = 1

for i in range(3, 51):
	T[i] = i - 1
	for j in range(3, i):
		for k in range(0, i-j):
			T[i] += T[i-j-k-1]
			
answer = T[50]
		
print answer
assert answer == 16475640049