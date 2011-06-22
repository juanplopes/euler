import System
import System.Linq.Enumerable
import EulerTools from boot

answer as BigInteger = 0
mod as BigInteger = 10000000000
for i as long in range(1, 1001):
	ii = BigInteger(i)
	answer += ii.ModPow(ii, mod)
answer %= mod
	
print answer
assert answer == 9110846700