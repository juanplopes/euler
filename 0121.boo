/*
Calculates all possible take scenarios as a bitmask where 1 represents taking
a blue disc and 0 taking a red disc.

Then, calculating the exact probability of taking, e.g.:

1011

1/2 * 2/3 * 1/4 * 1/5

Then only counts it as a valid probability if the bitcount (i.e. the quantity
of blue discs taken) is greater than the half of total turns.
*/
import System
import System.Linq.Enumerable

def chance(k as int, n as int):
    res = 1.0;
    bitc = 0
    for i in range(n):
        if k & 1:
            res *= 1.0/(2+i)
            bitc += 1
        else:
            res *= (1.0+i)/(2+i)
        k >>= 1
        
    return (res if bitc > n/2 else 0);


res = 0.0
for i in range(2**15):
    res += chance(i, 15)

answer = cast(int, 1/res)
print answer
assert answer == 2269
