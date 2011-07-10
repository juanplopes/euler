import System
import System.Linq.Enumerable
import EulerTools from boot

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

def convergents(n as int):
	b = CF(n).First()
	L = (Number(1),Number(0))
	T = (Number(b),Number(1))
	for i in CF(n).Skip(1):
		yield T
		L, T = (T, (i*T[0]+L[0], i*T[1]+L[1]))

def is_perfect_square(D as int):
	return cast(int,cast(int, Math.Sqrt(D))**2) == D
		
max = Number(0)
for D in range(1001):
	if is_perfect_square(D): continue
	for a,b in convergents(D).Take(100):
		if a*a-D*b*b == 1:
			if a > max:
				max = a
				answer = D
			break

print answer
assert answer == 661
