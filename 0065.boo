import System
import System.Linq.Enumerable

D = array(int, 102)
D[0] = 2
for i in range(1, 102):
	n=i-2
	if n%3==0:
		D[i] = (n/3)*2+2
	else:
		D[i] = 1

def N(k as int) as BigInteger:
	n as BigInteger = 0
	d as BigInteger = 1
	for i in range(k, 0):
		n,d= d, d*D[i]+n
	return d*2+n

def digits_of(k as int):
	n as BigInteger = N(k)
	while n>0:
		yield cast(int, n%10)
		n/=10

answer = digits_of(99).Sum()

print answer
assert answer == 272