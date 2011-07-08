import System
import System.Linq.Enumerable
import EulerTools from boot

L = 1e6+1
T = range(L).ToList()
for n in range(2, L):
  if T[n] == n:
    for k in range(n, L, n):
      T[k] *= 1.0 - 1.0/n;

answer = -1L
for i in T:
	answer += i
	
print answer
assert answer == 303963552391