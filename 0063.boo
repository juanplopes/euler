import System
import System.Linq.Enumerable
import EulerTools from boot


def count(a as Number):
	c = 0
	while(a>0): 
		c+=1
		a/=10
	return c

answer = 0
for a as Number in range(1,10):
	for b in range(30):
		if count(a.Pow(b)) == b:
			answer+=1
		
print answer
assert answer == 49