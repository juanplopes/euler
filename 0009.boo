import System
import System.Linq.Enumerable

a=0.0;b=0.0;c=0.0
for i in range(int.MaxValue):
	a = i
	b = (1e6 - 2000*a) / (2000 - 2.0*a)
	c = Math.Sqrt(a**2+b**2)
	if b == cast(int, b) and c == cast(int, c) and a < b and b < c:
		break

answer = a*b*c

print answer
assert answer == 31875000