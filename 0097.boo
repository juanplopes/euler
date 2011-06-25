import System
import System.Linq.Enumerable
import EulerTools from boot

answer as BigInteger = (28433 * BigInteger(2).ModPow(7830457, 1e10) + 1) % 1e10

print answer
assert answer == 8739992577