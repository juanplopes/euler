/*
First, precalculate all the values for rad(n) using same method as problem 124.

Iterates through all possible c values. For each c, iterates trough all 
possible a values sorted by rad(a). We do this so we can stop iteration ealy
if rad(a)*rad(c) > c/2, because rad(b) will be at least 2.

We check if gcd(a,c) == 1. If so, as a+b=c, we know also gcd(a,b) == 1 and 
gcd(b,c) == 1. This is because b=c-a, if no divisor of c can divide a, then it
can't divide c-a, which is b. The same for a divisors.
*/
import System
import System.Linq.Enumerable

def gcd(a as int, b as int):
    while(b): 
        tmp = b
        b = a%b
        a = tmp
    return a;

L = 120000
primes = PrimeNumbers(L)

rad = array(long, L)
for i in range(L): 
    rad[i] = 1

for i in primes.Until(L):
    for j in range(i, L, i):
        rad[j] *= i

sorted_rad = range(1, L).OrderBy({x|rad[x]}).ToList()

answer = 0
for c in range(3, L):
    for a in sorted_rad:
        if a>c/2 or not gcd(a, c) == 1: continue
        if rad[a]*rad[c] > c/2: break
        b = c-a
        
        if a<b and b<c and rad[a]*rad[b]*rad[c]<c:
            #print a, b, c
            answer += c

print answer
assert answer == 18407904
