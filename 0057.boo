import System
import System.Linq.Enumerable
import EulerTools from boot

def num_digits(n as Number):
	return n.ToString().Length

print Number(10000000).Pow(2).Length
	
n = Number(1)
d = Number(2)

answer = 0
for i in range(1000):
	if num_digits(n+d) > num_digits(d):
		answer+=1
	n, d = (d,n+d*2)
		
print answer
assert answer == 153