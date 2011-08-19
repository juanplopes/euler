/*
Based on http://oeis.org/A143714

Just summing up all values in this sequence
*/
import System
import System.Linq.Enumerable

c = 0
for m in range(3, int.MaxValue):
    if c > 10**6: 
        answer = m-1
        break
    for ab in range(3, 2*m):
        s = Math.Sqrt(ab*ab + m*m)
        if s == cast(int, s):
            c += Math.Min(ab, m+1) - cast(int, (ab+1)/2)
            
print answer
assert answer == 1818