/*
Generates all diagonal values and check for their primality.

The gotcha here is that the primes can get big (and they're many), so the 
primality check through the sieve is not efficient enough. So, we're using the
Miller-Rabin primality test to check if the diagonal number is prime.
*/
import System
import System.Linq.Enumerable

def pow(a as int, n as int, mod as int):
   r, p = (1L, cast(long, a))
   while(n):
      if n%2: r=(r*p)%mod
      p=(p*p)%mod
      n/=2

   return r

 
def witness(a as int, n as int):
   u,t= (n/2, 1)
   while(u%2==0): u,t = (u/2, t+1)
      
   prev = pow(a,u,n);
   
   for i in range(t):
      curr=(prev*prev)%n
      if curr==1 and prev!=1 and prev!=n-1: return true
      prev=curr
      
   return curr != 1
   
 
def is_prime(n as int):
   if n in (2, 7, 61): return true
   if witness(2,n): return false
   if witness(7,n): return false
   if witness(61,n): return false
   return true
    
n, p = (1, 0)
for side in range(3, 100000, 2):
    for i in range(4):
        n += side-1
        if (is_prime(n)): p+=1
    if p/(2*side-1.0) < 0.1:
        answer = side
        break

print answer
assert answer == 26241