/*
Euler's theorem says that if a and b are coprimes, a^phi(b) mod b === 1

1777 is coprime with 1e8. And phi(1e8) = 4e7

So, we reduce all exponents executing them from right to left mod 4e7.

Then, at the end, we just power the base to the resulting exponent mod 1e8.
*/
import System
import System.Linq.Enumerable

def pow(a as long, n as long, mod as long):
   r, p = 1L, a
   while(n):
      if n%2: r=(r*p)%mod
      p=(p*p)%mod
      n/=2

   return r

def hyperpow(a as long, n as long):
    exponent = a
    for i in range(n-2):
        exponent = pow(a, exponent, 40000000)
    return pow(a, exponent, 100000000)

answer = hyperpow(1777, 1855)
print answer
assert answer == 95962097
