import System
import System.Linq.Enumerable

def CF(n as int):
	n1,d1 =(0,1)
	sqrtn = Math.Sqrt(n)
	while true:
		if d1 == 0: break
		
		nextn = cast(int, (sqrtn + n1) / d1)
		yield nextn
		
		n2, d2 = (d1, n1 - d1 * nextn)
		n3, d3 = (-d2, (n - d2 ** 2) / n2)
		n1, d1 = (n3, d3)

def special_root(n as int, p as int):
	b = CF(n).First()
	L = (BigInteger(1),BigInteger(0))
	T = (BigInteger(b),BigInteger(1))
	for i in CF(n).Skip(1).Take(p*2):
		L, T = (T, (i*T[0]+L[0], i*T[1]+L[1]))
	return T[0] * BigInteger(10).Pow(p) / T[1]

def is_perfect(r as int, n as int):
	return r*r == n
	
def sum_of(n as int):
	if is_perfect(Math.Sqrt(n), n): return 0
	root = special_root(n, 99)
	r = 0
	while(root > 0):
		r += cast(int, root % 10)
		root /= 10
	return r

answer = range(1, 101).Sum(sum_of)
	
print answer
assert answer == 40886
