import System
import System.Linq.Enumerable
import EulerTools from boot

def digit_sum(a as Number):
	sum = 0
	while(a>0):
		sum += a%10
		a/=10
	return sum

def all_numbers():
    #esoteric constraints, you may try without them
	for a in range(90,100):
		for b in range(90,100):
			yield Number(a).Pow(b)
	
answer = all_numbers().Max(digit_sum)
	
print answer
assert answer == 972