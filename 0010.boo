/*
Enumerate all primes upto 2000000 using Sieve of Eratosthenes.
*/
import System
import System.Linq.Enumerable

answer = PrimeNumbers(2*1000000).Cache.Select({x|Convert.ToInt64(x)}).Sum()

print answer
assert answer == 142913828922
