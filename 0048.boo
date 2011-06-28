import System
import System.Linq.Enumerable
import EulerTools from boot

answer as Number = 0
mod as Number = 10000000000

for i as long in range(1, 1001):
	answer += Number(i).Pow(i, mod)
answer %= mod
	
print answer
assert answer == 9110846700