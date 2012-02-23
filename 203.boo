/*
Creates and yields all pascal numbers, then create a distinct list of them.
Filters only who ares square-free, by factorizing and checking if all factors
are distinct. Sum them.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()

def is_square_free(n as long):
    factors = primes.Factorize(n).ToArray()
    return factors.Distinct().Count() == factors.Length

def pascal(L) as long*:
    P = matrix(long, L, L)

    for i in range(L):
        P[i, 0] = 1

    yield 1L
    for i in range(1, L):
        for j in range(1, i+1):
            yield v = P[i-1,j] + P[i-1, j-1]
            P[i,j] = v

answer = pascal(51).Distinct().Where(is_square_free).Sum()
print answer
assert answer == 34029210557338