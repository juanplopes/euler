import System
import System.Linq.Enumerable

C = matrix(int, 101, 101)

for i in range(101):
	C[i, 0] = 1
	C[0, i] = 1
	C[i, i] = 1

answer = 0
for n in range(1,101):
	for k in range(1,n):
		if (C[n-1, k] != -1):
			C[n,k] = C[n-1, k] * n / (n-k)
			if (C[n,k] > 1e6): 
				C[n,k] = -1
				answer+=1
		else:
			C[n,k] = -1
			answer+=1


			
print answer
assert answer == 4075