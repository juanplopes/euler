import System
import System.Linq.Enumerable

T as (long, 2)  = matrix(long, 21, 21)
for i in range(21): 
	T[i,0] = 1
	T[0,i] = 1

for i in range(1,21):
	for j in range(1,21):
		T[i,j] = T[i-1, j] + T[i, j-1]
		
answer = T[20,20]

print answer
assert answer == 137846528820