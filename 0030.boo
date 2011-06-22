import System
import System.Linq.Enumerable

def is_sinister(n as int):
	sum = 0
	d = n
	while(d>0):
		sum += Math.Pow(d%10, 5)
		d/=10
	return sum==n
	
answer = range(2,200000).Where(is_sinister).Sum()
	
print answer
assert answer == 443839