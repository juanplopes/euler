import System
import System.Linq.Enumerable
import EulerTools from boot

answer = PrimeNumbers().Skip(10000).First()

print answer
assert answer == 104743