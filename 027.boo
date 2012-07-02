/*
Almost brute force. Intelligent only to know that the best values for b are
primes, since prime numbers are coprimes to all numbers before them.

Also, when n==b, b^2 + ab + b is divisible by b, so there can be at most b 
consecutive prime numbers. This allows us to prune all values of b that are
lesser than the current max.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()

max = 0
for a in range(-1000, 1000):
    for b in primes.Until(999):
        if b<max: continue
        n = range(b).Select({n|n*n+a*n+b}).TakeWhile({n|n>0 and primes.IsPrime(n)}).Count()
        if (n>max):
            max = n
            answer = a*b
            
print answer
assert answer == -59231
