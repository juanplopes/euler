import System
import System.Linq.Enumerable

def T(n as long) as long:
	if (n==0): return 1
	x = 2*n+1
	y = x-2
	return 2*(x*x+y*y+x-1)

answer = 0
for i in range(1001/2+1):
	answer += T(i)
	
print answer
assert answer == 669171001