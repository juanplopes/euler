/*
R(k) can be writen as: (10^k-1) / (10-1).

Knowing if R(k) is divisible by some prime p is same as knowing if:

(10^k-1)/9 mod p == 0
or
(10^k-1) mod (p*9) == 0

Then, we just calculate this mod using podmod and find the first 40 primes
that matches the condition.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers(100000)

def pow(a as int, n as int, mod as int):
   r, p = (1L, cast(long, a))
   while(n):
      if n%2: r=(r*p)%mod
      p=(p*p)%mod
      n/=2

   return r

def is_divisible(p as int):
	return (pow(10, 1000000000, p*9)-1)%(p*9)==0

answer = primes.Where(is_divisible).Take(40).Sum()
print answer
assert answer == 843296
