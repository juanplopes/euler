/*
Seems the maximum value for K is round(N/e) (natural constant).

So it's just a matter of determining if N/K is terminating.

We check that verifying if the reduced form of k (taking of factors 2 and 5) is
divisible by the numerator.
*/
import System
import System.Linq.Enumerable

def reduce(k as int):
    while true:
        if not k%2: k/=2
        elif not k%5: k/=5
        else: break
    return k
        

def D(N as int):
    k = cast(int, Math.Round(N/Math.E))
    
    return (N if N % reduce(k) else -N)


answer = range(5, 10001).Sum(D)
print answer
assert answer == 48861552
