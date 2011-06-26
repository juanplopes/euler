import System
import System.Linq.Enumerable
import EulerTools from boot

def pow(a as BigInteger, b as BigInteger) as BigInteger:
	if (b==0): return 1
	result = BigInteger(1)
	if (b%2==1): result*=a
	d = pow(a,b/2)
	return result*d*d
	
def count(a as BigInteger):
	c = 0
	while(a>0): 
		c+=1
		a/=10
	return c

answer = 0
for a as BigInteger in range(1,10):
	for b in range(30):
		if count(pow(a,b)) == b:
			answer+=1
		
print answer
assert answer == 49