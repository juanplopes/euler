/*
Partition problem again. But the original solution is O(n^2) and n can get big 
in this problem.

Now, instead of using the classic recurrence, we're gonna use integer partition
with pentagonal numbers. It uses the reciprocal of Euler's function, and defines
that:

p(k) = p(k - 1) + p(k - 2) - p(k - 5) - p(k - 7) + p(k - 12) ...

These values subtracted from k are the generalized pentagonal numbers, that are
define by generating pentagonal numbers for n = 1, -1, 2, -2, ... We precompute 
these numbers at P.
*/
import System
import System.Linq.Enumerable
    
P = array(int, 1000)
for i in range(1, P.Length / 2):
    P[2*i-2] = i*(3*i-1)/2
    P[2*i-1] = -i*(-3*i-1)/2

T = array(int, 1e5)

T[0] = 1
answer = 0
for answer in range(1, T.Length):
    s, j = 0, 0

    while P[j] <= answer:
        s = (s + (1 if j%4<2 else -1) * T[answer-P[j]]) % 1e6
        j++
        
    if s==0: break
    T[answer] = s
        
print answer
assert answer == 55374