/*
Use "powmod" principle. 

E.g.: (2^32)%100 == ((2^16)%100 * (2^16)%100) %100
*/
import System
import System.Linq.Enumerable

answer as BigInteger = 0
mod as BigInteger = 10000000000

for i as long in range(1, 1001):
	answer += BigInteger(i).Pow(i, mod)
answer %= mod
	
print answer
assert answer == 9110846700