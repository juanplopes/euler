import System
import System.Linq.Enumerable
import EulerTools from boot

for x as long in range(286,100000):
	c = (x**2 + x)/2
	y = (0.5 + Math.Sqrt(0.25 + 6*c))/3
	z = (1 + Math.Sqrt(1 + 8*c))/4
 
	if y - cast(int, y) == 0 and z - cast(int, z) == 0:
		answer = x*(x+1)/2
		break
		
print answer
assert answer == 1533776805