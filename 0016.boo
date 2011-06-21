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

def convert(n as int) as int*:
	while(n>0):
		n,r=(n/10,n%10)
		yield r
	
def pow2(p as int):
	v as (int) = convert(2).ToArray()
	for i in range(p-1):
		v = sum(v, v).ToArray()
	return v.Cast[of int]().Sum()

answer = pow2(1000)


print answer
assert answer == 1366