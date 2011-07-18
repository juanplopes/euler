/*
Runs through all of primes until the limit, making a sieve to discover all
values of rad. Since each prime is only counted once, there is no special logic
to do.

Then, it's just a matter of ordering the list and finding the E(k).
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()

L = 1e5+1
rad = array(int, L)
for i in range(L): rad[i] = 1

for i in primes.Until(L):
    for j in range(i, L, i):
        rad[j] *= i

def E(k): 
    return range(L).OrderBy({x as int|rad[x]}).Skip(k).First()

answer = E(10000)
print answer
assert answer == 21417