import System
import System.Linq.Enumerable

def factors(n as int):
	for x in range(1,n):
		if n%x==0: yield x

D = range(10000).Select({n|factors(n).Sum()}).ToArray()
def d(i as int):
	if (i<0 or i>=10000): return -1
	return D[i]

sum = 0
for a in range(2,10000):
	b = d(a)
	if a==d(b) and b==d(a) and a != b:
		sum+=a

answer = sum
print answer
assert answer == 31626