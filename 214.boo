/*
Precalculate all the phi values using a sieve algorithm. Mostly Eratosthenes,
but multiplying it by the phi factor (1-1/p) for each prime that composes the
number.

Then calculates the totient chain length by using the recurrence

S[i] = S[totient(i)] + 1

Check if the value is prime and sum if the totient chain size is 25.
*/
import System
import System.Linq.Enumerable

L = 40000001
primes = PrimeNumbers(L)
P = primes.Cache
T = array(int, L)
S = array(int, L)
for i in range(L):
    T[i] = i
for n in P:
    for k in range(n, L, n):
      T[k] *= 1.0 - 1.0/n;

answer = 0L
S[1] = 1
for i in range(2, L):
    S[i] = S[T[i]] + 1
    if primes.IsPrime(i) and S[i] == 25:
        answer += i

print answer
assert answer == 1677366278943
