/*
Dynamic programming solution:

To calculate T[n], the number of solutions for n units, we try to insert blocks
varying from length (j) 1 to 5, as 1 being an artificial block of color black.
If we put a block of length 2, we solve the problem then for T[n-2].
*/
import System
import System.Linq.Enumerable

L = 51
T = array(long, L)

for i in range(2): T[i] = 1

for i in range(2, L):
    for j in range(1, 5):
        if (i-j >= 0):
            T[i] += T[i-j]

answer = T[L-1]
        
print answer
assert answer == 100808458960497