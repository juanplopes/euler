"""
Brute force making bignum add by hand. Using base-10 integer array as storage.
Very silly, but does the job.

Someone told me that 
=CEILING( (1000 - 1 + LOG10(SQRT(5))) / LOG10((1+SQRT(5))/2),1)
does the job faster, but I want to keep this original solution.
"""
import System
import System.Linq.Enumerable

def sum(a as (int), b as (int)) as int*:
	flag = 0
	for i in range(Math.Max(a.Length, b.Length)):
		if i<a.Length: flag+=a[i]
		if i<b.Length: flag+=b[i]
		yield flag%10
		flag /= 10
	if (flag): yield flag
	
def fib() as (int)*:
	a,b = ((0,),(1,))
	while(true):
		a,b = (sum(a,b).ToArray(), a)
		yield a

answer = 0
for a in fib():
	answer+=1
	if a.Length == 1000:
		break
print answer
assert answer == 4782