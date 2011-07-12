/*
Test all possible sum of two abundant numbers and store the results.
Sum the numbers that doesn't have any results associated.
*/
import System
import System.Linq.Enumerable

n = 21000
F = array(int, n)

for i in range(1, n/2):
	for j in range(i*2, n, i):
		F[j] += i
	
A = range(n).Where({x as int|F[x] > x}).ToArray()
C = array(bool, n)

for i in range(A.Length):
	for j in range(i+1):
		if (A[i]+A[j] >= C.Length): break
		C[A[i]+A[j]] = true

answer = 0	
for i in range(n):
	if not C[i]: answer+=i
	
print answer
assert answer == 4179871