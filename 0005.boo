import System
import System.Linq.Enumerable
import EulerTools from boot

def gcd(a as long, b as long):
	while(b): a, b = (b, a%b)
	return a;

def lcm(a as long, b as long):
	return a*b/gcd(a,b)
	
answer as long = 1
for i in range(1, 21):
	answer = lcm(answer, i)

print answer
assert answer == 232792560