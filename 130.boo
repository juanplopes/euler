/*
Like 132:

R(k) can be writen as: (10^k-1) / (10-1).

Knowing if R(k) is divisible by some number n is same as knowing if:

(10^k-1)/9 mod n == 0
or
(10^k-1) mod (n*9) == 0
or
10^k mod n*9 == 1

We just need to know, then, which are the 25 first composite numbers for which 
R(k) is divisible by k-1.
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

P = PrimeNumbers()

def pow(a as int, n as int, mod as int):
   r, p = (1L, cast(long, a))
   while(n):
      if n%2: r=(r*p)%mod
      p=(p*p)%mod
      n/=2

   return r

def have_property(n as int):
    return not P.IsPrime(n) and pow(10, n-1, n*9) == 1

answer = range(5, int.MaxValue).Where(have_property).Take(25).Sum()
    
print answer
assert answer == 149253
