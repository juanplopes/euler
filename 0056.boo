import System
import System.Linq.Enumerable

def digit_sum(a as BigInteger):
	sum = 0
	while(a>0):
		sum += a%10
		a/=10
	return sum

def all_BigIntegers():
    #esoteric constraints, you may try without them
	for a in range(90,100):
		for b in range(90,100):
			yield BigInteger(a).Pow(b)
	
answer = all_BigIntegers().Max(digit_sum)
	
print answer
assert answer == 972