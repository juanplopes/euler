"""
Replace n by triangle index in pentagonal and hexagonal formulae. That is:

x = n(n+1)/2 (triangle)
x = n(3n+1)/2 (pentagonal)
x = n(2n-1)/2 (hexagonal)

If for an arbirary value of x we can solve these equations, then we have an
answer.

So, what we try is to generate a known value of x using a triangle formula and
verifying if it satisfies the pengatonal and hexagonal too.
"""
import System
import System.Linq.Enumerable

for n as long in range(286,100000):
	x = (n**2 + n)/2
	p = (0.5 + Math.Sqrt(0.25 + 6*x))/3
	h = (1 + Math.Sqrt(1 + 8*x))/4
 
	if p - cast(int, p) == 0 and h - cast(int, h) == 0:
		answer = x
		break
		
print answer
assert answer == 1533776805