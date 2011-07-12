/*
Precalculated sizes for units, tens, hundreds and teens.
Different calculation only for teen values (11~19)
*/
import System
import System.Linq.Enumerable

U = (0, 3, 3, 5, 4, 4, 3, 5, 5, 4)
T = (0, 6, 6, 8, 8, 7, 7, 9, 8, 8)
D = (0, 3, 6, 6, 5, 5, 5, 7, 6, 6)
C = (0, 10, 10, 12, 11, 11, 10, 12, 12, 11)

def NS(n as int):
	if (n==1000): return 11

	u = U[n%10]
	d = D[n/10%10]
	c = C[n/100%10]
	teen = (n % 100 in range(11, 20))
	
	if (teen):
		n = c+T[n%10]
		if (c and u): n+=3
	else:
		n = c+d+u
		if (c and (u or d)): n+=3
	return n
	
answer = range(1, 1001).Select(NS).Sum()

print answer
assert answer == 21124