"""
Ad-hoc. Using BigInteger.
"""
import System
import System.Linq.Enumerable

n = BigInteger(2).Pow(1000)

answer = 0
while(n > 0):
	answer += n%10
	n/=10

print answer
assert answer == 1366