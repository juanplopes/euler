/*

Lets start with how many N-digit hex strings are there. Consider that it can't
start with 0:

T(n) = 15*16*16...
T(n) = 15*16^(n-1)

Let's remove from it those who doesn't have 0, 1 or A.

N0(n) = 15*15^(n-1) #15 because it couldn't start with 0 anyway
N1(n) = 14*15^(n-1)
NA(n) = 14*15^(n-1)

But there is some intersection between N0, N1 and NA, that is those who have 
nor 0 nor 1, nor 1 nor A, nor 0 nor A. We need to re-add them to fix the 
redundancy in last statements:

N01(n) = 14*14^(n-1) #again, because it couldn't start with 0 anyway
N0A(n) = 14*14^(n-1)
N1A(n) = 13*14^(n-1)

But adding back those, we still have to re-remove the case N01A:

N01A(n) = 13*13^(n-1)

So, a general formula would be:

A(n) = T(n) - (N0(n) + N1(n) + NA(n)) + (N01(n) + N0A(n) + N1A(n)) - N01A(n)

We can inline all of this:

A(n) = 15*16^(n-1) - (15+14+14)*15^(n-1) + (14+14+13)*14^(n-1) - 13*13^(n-1)
*/
import System
import System.Linq.Enumerable

def A(n as int) as long:
    return 15*BigInteger(16L).Pow(n-1) - (15+14+14)*BigInteger(15L).Pow(n-1) + (14+14+13)*BigInteger(14L).Pow(n-1) - 13*BigInteger(13L).Pow(n-1)

answer = range(3, 17).Sum(A).ToString('X')

print answer
assert answer == '3D58725572C62302'

