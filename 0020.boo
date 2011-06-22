import System
import System.Linq.Enumerable
import EulerTools from boot
	
def factorial(n as int) as int*:
	one = BigInteger(1L)
	for i in range(1,n+1):
		one = one * i
	while one > 0:
		yield (one % 10).IntValue()
		one /= 10

	
answer = factorial(100).Sum()
print answer
assert answer == 648