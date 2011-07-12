/*
Use common algorithm to create continuous fractions. Do it stopping before the
point it starts to repeat. The answer includes the first parameter, so, instead
of testing odds, we are testing the even.
*/
import System
import System.Linq.Enumerable

def CF(n as int):
	n1,d1 =(0,1)
	sqrtn = Math.Sqrt(n)
	while true:
		if d1 == 0: break
		
		nextn = cast(int, (sqrtn + n1) / d1)
		yield nextn
		
		if nextn == cast(int, sqrtn) * 2: break
		
		n2, d2 = (d1, n1 - d1 * nextn)
		n3, d3 = (-d2, (n - d2 ** 2) / n2)
		n1, d1 = (n3, d3)
		

answer = range(10001).Count({x as int|CF(x).Count()%2==0})
print answer
assert answer == 1322
