/*
There are 1000/3 multiples of 3 below 1000.

Their sum is 
(3+6+9+...+996+999) = 
(1+2+3+...332+333)*3 =
(333*334/2)*3
*/
import System.Linq.Enumerable

def T(n as int, k as int):
    m = n/k
    return m*(m+1)/2*k

answer = T(999, 3) + T(999, 5) - T(999, 15)

print answer
assert answer == 233168
