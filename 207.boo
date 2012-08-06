/*
We have that 4^t = 2^t + k. It is easy to see that 4^t = 2^2t and that 4^t is
(2^t)^2. Since 2^t must be integer, if we replace 2^t with x, we have that:

x^2 = x + k

It means that we must find the distance (k) between a number (2^t) and its
square (4^t).

For this algorithm, we guess the value for 2^t meaning all integers. We know
that t will be integer if and only if 2^t is an integer power of 2. So, the
number of perfect partitions up to x is equal to floor(log2(x)) / (x-1). x-1
because x=1 isn't valid.

The, it's just a matter of trying all values of x until find one with P lesser
than 1/12345. The value of k, then, is the distance between x and x^2, that is:
x^2-x or x*(x-1).
*/
import System
import System.Linq.Enumerable

log2 = Math.Log(2)
for x in range(2,2000000):
    a = Math.Floor(Math.Log(x) / log2) / (x-1)
    if a < 1/12345.0:
        answer = x*(x-1.0)
        break
        
print answer
assert answer == 44043947822
