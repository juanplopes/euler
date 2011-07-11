"""
Trivial prime discovery. Internally using Sieve of Eratosthenes.
"""
import System
import System.Linq.Enumerable

answer = PrimeNumbers().Skip(10000).First()

print answer
assert answer == 104743