/*
Don't really know how to explain that, but somehow this function turns that,
for every value greater than a limit that I didn't care to know, this statement
holds:

Un == Un+2

So, it's just a matter of calculating a function to find these two values and
assume that U10^12 and U10^12+1 will be these two.
*/
import System
import System.Linq.Enumerable

def f(x as double):
    return Math.Floor(2.0**(30.403243784-x*x))/1000000000.0
    
a,b,c = -1.0,-2.0,-3.0

while true:
  a,b,c = f(a), a, b
  if a==c:
    answer = a+b
    break

print answer
assert answer == 1.710637717

