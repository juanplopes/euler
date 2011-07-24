/*
When n is even:

(a-1)^n == ((a-1)^2)^n/2 == (a^2-2a+1) === -2a+1 mod a^2
(a+1)^n == ((a+1)^2)^n/2 == (a^2+2a+1) === 2a+1 mod a^2

(a-1)^n + (a+1)^n === 2 mod a^2

When n is odd:

The same, but multiplying by (a-1) and (a+1) factors, respectively.

Which results in 2*a*n % (a*a)

The least odd value for n that doestn't result in value greater than a*a is the
last odd value before a/2, that is (a-1)/2.
*/
import System
import System.Linq.Enumerable

answer = 0
for a in range(3, 1001):
    n = (a-1)/2
    answer += 2*a*n
print answer
assert answer == 333082500