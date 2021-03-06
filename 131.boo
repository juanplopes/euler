/*
Check for prime numbers in sequence http://oeis.org/A003215

More info at http://mathworld.wolfram.com/CubanPrime.html
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers(10**6)

def A003215(L as int):
    a = 1L
    for i in range(L):
        a += 6*i
        if a >= L: break
        yield a

answer = A003215(10**6).Count(primes.IsPrime)
print answer
assert answer == 173