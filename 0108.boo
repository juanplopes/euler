/*
First, we have to know some things:

This solution applies both to 108 and 110. There is a simpler solution that
solves 108 in desired time, but would never be good for 110. So I made this one.

The number of solutions for the specified equation is defined by factorizing
the "n". If n = p1^a1*p2^a2...pn^an, then, the solution is given by
(2*a1+1) * (2*a2+1) ... (2*an+1)/2 +1. But, calculating it is not easy. For the 
problem 108, it would be good enough, but for 110, it would never finish

We know that the solution is among the highly composite numbers, so we start by 
defining the limits of the problem. That is, the first product of primes
2*3*5*7*11... the 3*3*3*3*3... of the solution reaches what we want, ie, the
double of the desired number 10**3*2 or 4*10**6*2. This is just to define upper bound
limits for the future backtrack. In this preprocessing, we achieve K, T and N, 
that means the upper bound number of solutions K for the upper bound n=T using 
at most the prime indexed by N.

e.g. K=3^6, T=2*3*5*7*11*13, N=6

With these numbers in hand, we write a backtrack function to generate all the 
combination of the prime powers, ensuring the decreasing order, ie, if the 
answer contains 2^a1, for example, the power of 3 would never exceed a1. We can 
prove that is right by ensuring we will always try to get the minimum number 
with highest number of factors. 

We don't try to generate a vector and regenerate the two products everytime. 
Instead, we keep track of the current k and t, relative to the upper bounds K 
and T. As K involves sum of products, each prime index uses a temporary kk to 
hold the 2*i+1

Every time k*kk is lesser than K, but greater the number we want (L), we 
register a new minimum K with a new answer T.

At the end of the backtrack, we hope T is the desired answer.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()

L = 10**3 * 2
K, T = BigInteger(1), BigInteger(1)
N = 0

for p in primes:
    K,T = (K*3, T*p)
    N++
    if K >= L: break

P = primes.Take(N).ToArray()

def backtrack(p as int, last as BigInteger, k as BigInteger, t as BigInteger):
    if p >= N: return
    prime = P[p] 
    i, kk = 0, 1
    while k*kk < K and t < T and i < last:
        i, kk = i+1, kk+2
        t *= prime
        
        if k*kk >= L and k*kk<K:
            K, T= (k*kk,t)
        
        backtrack(p+1, i, k*kk, t)
        
backtrack(0, int.MaxValue, 1, 1)

answer = T
print answer
assert answer == 180180