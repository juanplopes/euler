"""
Enumerate all primes upto 2000000 using Sieve of Eratosthenes.
"""
import System
import System.Linq.Enumerable

answer = PrimeNumbers(2e6).Cache.Select(Convert.ToInt64).Sum()

print answer
assert answer == 142913828922