/*
The base may be 1-digit, so it's possible to raise it to n and the result have
n digits. Try the raises and see how many results are n-digit.
*/
import System
import System.Linq.Enumerable


def count(a as BigInteger):
	c = 0
	while(a>0): 
		c+=1
		a/=10
	return c

answer = 0
for a as BigInteger in range(1,10):
	for b in range(30):
		if count(a.Pow(b)) == b:
			answer+=1
		
print answer
assert answer == 49