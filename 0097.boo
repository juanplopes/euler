/*
Solving big power using "modpow".
*/
import System
import System.Linq.Enumerable

answer as BigInteger = (28433 * BigInteger(2).Pow(7830457, 10000000000) + 1) % 10000000000

print answer
assert answer == 8739992577
