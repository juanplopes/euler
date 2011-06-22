import System
import System.Linq.Enumerable
import EulerTools from boot

answer = PrimeNumbers().Factorize(600851475143).Max()

print answer
assert answer == 6857