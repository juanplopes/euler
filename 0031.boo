import System
import System.Linq.Enumerable

n = 201
W = (1, 2, 5, 10, 20, 50, 100, 200)
K = matrix(int, n, W.Length)

for i in range(W.Length): K[0, i] = 1

for i in range(1,n):
	for j in range(W.Length):
		if (i-W[j] >= 0): K[i,j] = K[i,j] + K[i - W[j], j]
		if (j-1>=0):	  K[i,j] = K[i,j] + K[i, j-1] 

answer = K[200, W.Length-1]
print answer
assert answer == 73682