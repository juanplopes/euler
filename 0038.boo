"""
Brute force. Not gotchas. Just being brute.
"""
import System
import System.Linq.Enumerable

def is_pandigital(a as string):
	if a.Length != 9: return false
	digits = array(int, 10)
	for c in a:
		digits[cast(int, c) - cast(int, char('0'))]++
	return digits.Skip(1).All({x|x==1}) and digits[0] == 0

answer = 0
for i in range(1, 10000):
	sum as string = ''
	for j in range(1, 100):
		sum += (i*j).ToString()
		if sum.Length > 9: break
		if is_pandigital(sum): answer = Math.Max(answer, int.Parse(sum))
	
print answer
assert answer == 932718654