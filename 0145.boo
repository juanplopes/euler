/*
TODO
*/
import System
import System.Linq.Enumerable

def is_reversible(n as int):
    if n%10==0: return false
    n1, n2 = n, 0
    while n:
        n2 = n2 * 10 + n % 10
        n /= 10
    r = n1+n2
    while r:
        if r&1==0: return false
        r/=10
    return true

answer = range(1e8).Count(is_reversible)
print answer
assert answer == 608720