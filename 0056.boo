import System
import System.Linq.Enumerable
import EulerTools from boot

def pow(a as BigInteger, b as BigInteger) as BigInteger:
	if (b==0): return 1
	result = BigInteger(1)
	if (b%2==1): result*=a
	d = pow(a,b/2)
	return result*d*d	

def digit_sum(a as BigInteger):
	sum = 0
	while(a>0):
		sum += (a%10).IntValue()
		a/=10
	return sum

def all_numbers():
    #esoteric constraints, you may try without them
	for a in range(90,100):
		for b in range(90,100):
			yield pow(a,b)
	
answer = all_numbers().Max(digit_sum)
	
print answer
assert answer == 972