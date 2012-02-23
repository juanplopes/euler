/*
Backtrack through all possible distinct multiplications of numbers greater 
than 1. Also accumulates their sums. So, if we have a multiplication: 2x2x3, 
for example, we know we need (2x2x3)-(2+2+3) "1"s to complete the sum.

1x1x1x1x1x2x2x3 = 1+1+1+1+1+2+2+3

Just try to get the minimum product (pa) for each number of digits (na).
*/
import System
import System.Linq.Enumerable

R = array(int, 12001)
for i in range(R.Length):
    R[i] = 1000000
V = array(bool, 24001)

def backtrack(last as int, sum as int, prod as int, digits as int):
    if digits > 32: 
        return
    for i in range(last, 12000):
        sa = sum+i
        pa = prod*i
        if pa > 24000:
            return 

        na = pa-sa+digits
        if na < R.Length:
            R[na] = Math.Min(R[na], pa)
        backtrack(i, sa, pa, digits+1)

backtrack(2, 0, 1, 1)

answer=0
for i in range(2,12001):
    if not V[R[i]]:    
        answer+=R[i]
        V[R[i]]=true

print answer
assert answer == 7587457
