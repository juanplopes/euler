/*
Defines a function T, that mathematically generates all the numbers in the diag.

eg.: T(1) = 3+5+7+9, T(2) = 13+17+21+25

It is possible because the first last term of each spiral is always a an odd
square. And the first is always the last term of the last square + a quarter
spiral - 1.

So, the last is x*x and the first is y*y+x-1. So the total for spiral is twice
the sum of these values.
*/
import System
import System.Linq.Enumerable

def T(n as long) as long:
    if (n==0): return 1
    x = 2*n+1
    y = x-2
    return 2*(x*x+y*y+x-1)

answer = 0
for i in range(1001/2+1):
    answer += T(i)
    
print answer
assert answer == 669171001