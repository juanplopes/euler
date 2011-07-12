"""
Navigates through the regions of the decimal (1 digit, 2 digits, 3 digits)

find_in returns:
n = the number you stopped in, not the digit, the number (e.g. 123)
d = the position inside the number you stopped, counting from the right to left
    starting at 0
f = the number of digits at the area you're at, starting at 0

e.g. (456, 1, 2) means (456 / (10 ** (2 - 1)) % 10) = 5
"""
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