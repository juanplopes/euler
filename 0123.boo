/*
When n is even:

(a-1)^n == ((a-1)^2)^n/2 == (a^2-2a+1) === -2a+1 mod a^2
(a+1)^n == ((a+1)^2)^n/2 == (a^2+2a+1) === 2a+1 mod a^2

(a-1)^n + (a+1)^n === 2 mod a^2

When n is odd:

The same, but multiplying by (a-1) and (a+1) factors, respectively.

Which results in 2*a*n % (a^2)

Then, it's just to test it for all odd primes above the known answer.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers(10**6).Cache.ToList()

for n in range(7039, primes.Count, 2):
    p = primes[n-1] cast long
    if 2*n*p > 10**10: 
        answer = n
        break;

print answer
assert answer == 21035