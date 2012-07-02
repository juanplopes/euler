/*
Given x,y and z are terms of a decreasing arithmetic progression, we can 
redefine equation as 

x^2+(x-a)^2+(x-2a)^2=n, 

that can be written as:

-(x-a)*(x-5a) = n

For 'n' to stay positive, we need x-a to stay positive and x-5a to stay
negative. Also, x-2a should also be positive. So, x/5 < a < x/2.

We just loop through all possible values for x and a and count in T every found
solution for every possible n.
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

T = array(int, 1000000)

for x in range(1, 1300000):
    a = Math.Floor(x/5.0)+1
    while x-2*a > 0:
        n = -(x-a)*(x-5*a)
        if n>=1000000: break
        T[n] += 1
        a += 1
        
answer = T.Count({x|x==10})
print answer
assert answer == 4989
