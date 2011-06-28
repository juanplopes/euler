import System
import System.Linq.Enumerable
import EulerTools from boot

answer as Number = (28433 * Number(2).Pow(7830457, 1e10) + 1) % 1e10

print answer
assert answer == 8739992577