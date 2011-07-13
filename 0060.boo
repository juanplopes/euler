/*
Brute force solution. Precalculates all the primes and the possible relations
about them. Uses Miller-Rabin primality test since the numbers can get really 
big.

Caches PP(i,j) "does the pair i,j have the property"
Caches LOG10(i) "log10(P(i))+1"

What remains is pure brute force. With some pruning, but brute force.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()
L = 1051
D = (1, 1e1, 1e2, 1e3, 1e4, 1e5)

P = primes.Take(L).ToArray()
LOG10 = P.Select({x|D[cast(int, Math.Log10(x))+1]}).ToArray()

PP = matrix(bool, L, L)

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


for i in range(L):
	for j in range(i+1,L):
		PP[i,j] = is_prime(P[i] * LOG10[j] + P[j]) and is_prime(P[j] * LOG10[i] + P[i])
		PP[j,i] = PP[i,j]
		
answer = int.MaxValue
for a in range(L):
	if answer < int.MaxValue: break
	for b in range(a+1,L):
		if answer < int.MaxValue: break
		if not PP[a,b] or P[a]+P[b] >= answer: continue
		for c in range(b+1, L):
			if answer < int.MaxValue: break
			if not PP[c,b] or not PP[c,a] or P[a]+P[b]+P[c] >= answer: continue
			for d in range(c+1, L):
				if answer < int.MaxValue: break
				if not PP[d,c] or not PP[d,b] or not PP[d,a] or P[a]+P[b]+P[c]+P[d] >= answer: continue
				for e in range(d+1, L):
					if answer < int.MaxValue: break
					if not PP[e,d] or not PP[e,c] or not PP[e,b] or not PP[e,a] or P[a]+P[b]+P[c]+P[d]+P[e] >= answer: continue
					answer = P[a]+P[b]+P[c]+P[d]+P[e]
		
print answer
assert answer == 26033