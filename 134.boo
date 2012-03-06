/*
Given a and b, the problem asks you to solve:

x*b === a mod m #N is the 10 ^ "number of digits in a"

e.g., for a,b = (19,23)

23x % 100 = 19, find the least positive x

This equation can be written as:

23x - 100y = 19, that can be solved as a diophantine equation, using extended
Euclid algorithm.
*/
import System
import System.Linq.Enumerable

P = PrimeNumbers(1000010).Cache.ToArray()

def gcd(a as long, b as long) as (long):
    if b==0: return (1L, 0L)
    q = a/b
    x,y = gcd(b, a-q*b)
    return (y, x-q*y)

def solution(a as long, b as long):
    m = 10**cast(int, Math.Log(a)/Math.Log(10)+1)
    x,y = gcd(b, m)
    return ((((x*a)%m)+m)%m)*b

answer = 0L
for i in range(2, P.Length-1):
    a, b = P[i], P[i+1]
    answer += solution(a,b)
    
print answer
assert answer == 18613426663617118L
