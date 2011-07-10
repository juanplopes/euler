import System
import System.Linq.Enumerable

def CF(n as int):
	n1,d1 =(0,1)
	sqrtn = cast(int, Math.Sqrt(n))
	if sqrtn * sqrtn == n: 
		yield sqrtn * 2
	else:
		while true:
			nextn = cast(int, (Math.Sqrt(n) + n1) / d1)
			yield nextn

			n2, d2 = (d1, n1 - d1 * nextn)
			n3, d3 = (-d2, (n - d2 ** 2) / n2)

			if d3 == 1:
				yield sqrtn * 2
				break

			n1, d1 = (n3, d3)

answer = range(10001).Count({x as int|CF(x).Count()%2==0})
print answer
assert answer == 1322
