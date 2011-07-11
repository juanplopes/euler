import System
import System.Linq.Enumerable

def list(a as int, b as int) as decimal*:
	for i in range(2, a+1):
		for j in range(2, b+1):
			yield j*Math.Log(i)

BigIntegers = list(100,100).ToList()
BigIntegers.Sort()

answer = 1
for i in range(1,BigIntegers.Count):
	if (Math.Abs(BigIntegers[i] - BigIntegers[i-1]) > 1e-7f):
		answer++
			
print answer
assert answer == 9183