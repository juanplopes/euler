import System
import System.Linq.Enumerable
import EulerTools from boot

def pow(a as BigInteger, b as BigInteger) as BigInteger:
	if (b==0): return 1
	result = BigInteger(1)
	if (b%2==1): result*=a
	d = pow(a,b/2)
	return result*d*d

def terms(a as int, b as int): 
	for i in range(2, a+1):
		for j in range(2, b+1):
			yield pow(i,j)
		
answer = terms(100, 100).Distinct().Count()
		
print answer
assert answer == 9183