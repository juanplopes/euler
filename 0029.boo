"""
If a**b != x**y, then b*log(a) != y*log(x).
List all possible values for that count and check the distinct ones.
Since decimal comparison is stronger than double, but still weak, do this by 
sorting and checking the consecutive pairs with tolerance.
"""
import System
import System.Linq.Enumerable

def list(a as int, b as int) as decimal*:
	for i in range(2, a+1):
		for j in range(2, b+1):
			yield j*Math.Log(i)

numbers = list(100,100).ToList()
numbers.Sort()

answer = 1
for i in range(1,BigIntegers.Count):
	if (Math.Abs(BigIntegers[i] - BigIntegers[i-1]) > 1e-7f):
		answer++
			
print answer
assert answer == 9183