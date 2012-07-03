/*
Like 132:

R(k) can be writen as: (10^k-1) / (10-1).

Knowing if R(k) is divisible by some prime p is same as knowing if:

(10^k-1)/9 mod p == 0
or
(10^k-1) mod (p*9) == 0
or
10^k mod p*9 == 1

We use then modular power, but incrementally, given we must test many values of
k in range (1..p). We find the first k that respects the equality.

We only need to test for values greater than 1.000.000, because R(n) < n.
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

def first_divisible(p as int):
    n = 1
    m = p*9
    for k in range(1, p):
        n = (n*10)%m
        if n==1:
            return k

    return 0


L = 1000000
answer = 0
for p in range(L, int.MaxValue):
    if first_divisible(p) > L:
        answer = p
        break
    
    
print answer
assert answer == 1000023
