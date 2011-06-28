import System
import System.Linq.Enumerable

T = matrix(int, 101, 101)
for i in range(101):
	T[1, i] = 1

def sum(n as int, m as int) as int:
	if (n<0): return 0
	if (n==0): return 1
	if (T[n,m]!=0): return T[n,m]
	
	if (n==1): return 1
	s = 0
	for i in range(1, m+1):
		s += sum(n-i, i)
		
	T[n,m] = s
	return s
	
answer = sum(100, 100)-1
print answer
assert answer == 190569291