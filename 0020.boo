import System
import System.Linq.Enumerable

def mult(a as (int), b as int) as int*:
	flag = 0
	for i in range(a.Length):
		flag += a[i] * b
		yield flag%10
		flag /= 10
	while(flag):
		yield flag % 10
		flag /=10
	
	
def factorial(n as int) as int*:
	one = (1,)
	for i in range(1,n+1):
		one = mult(one, i).ToArray()
	return one

	
answer = factorial(100).Sum()
print answer
assert answer == 648