import System
import System.Linq.Enumerable

P10 = (1, 10,     100,     1000,     10000,     100000)
S   = (1, 10 * 2, 100 * 3, 1000 * 4, 10000 * 5, 100000 * 6)
L   = (9, 90 * 2, 900 * 3, 9000 * 4, 90000 * 5, 900000 * 6)

def find_in(n as int):
	for i in range(0, L.Length):
		if (n-L[i]<0): return ((n+S[i])/(i+1), (n+S[i])%(i+1), i)
		n -= L[i]

def D(n as int):
	n, d, f = find_in(n-1)
	return r = (n/P10[f-d])%10
	
answer = D(1e0) * D(1e1) * D(1e2) * D(1e3) * D(1e4) * D(1e5) * D(1e6)
		
print answer
assert answer == 210