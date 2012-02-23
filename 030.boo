/*
Brute force, caching n^5. Ignore one-digit numbers.
*/
import System
import System.Linq.Enumerable

D = range(10).Select({x as int|Math.Pow(x, 5)}).ToArray()

def can_be_written_in_weird_way(n as int):
    sum = 0
    d = n
    while(d>0):
        sum += D[d%10]
        d/=10
    return sum==n
    
answer = range(10,200000).Where(can_be_written_in_weird_way).Sum()
    
print answer
assert answer == 443839