import System
import System.Linq.Enumerable

E = array(int, 600)
E[0] = 1
E[1] = 1
E[89] = 89
SQR = (0, 1, 4, 9, 16, 25, 36, 49, 64, 81)
def ends_in(a as int) as int:
	if (a < E.Length and E[a] != 0): return E[a]
	sum = 0
	n = a
	while(a):
		sum += SQR[a%10]
		a/=10
	r = ends_in(sum)
	if (n < E.Length):
		E[n] = r
	return r
		
answer = range(1e7).Count({x|ends_in(x) == 89})
print answer
assert answer == 8581146