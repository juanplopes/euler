/*
Dynamic programming solution (related to 117, solved it first):

To calculate T[n], the number of solutions for n units, we try to insert blocks
varying from length (j) 1 to 5, as 1 being an artificial block of color black.
If we put a block of length 2, we solve the problem then for T[n-2].

Please notice that empty is not a valid solution. So we remove it from every
configuration.
*/
import System
import System.Linq.Enumerable

answer = 0L
for j in range(2, 5):
    T = array(long, 51)
    
    for i in range(2): T[i] = 1
    
    for i in range(2, 51):
        T[i] = T[i-1]
        if (i-j >= 0):
            T[i] += T[i-j]
    answer += T[50]-1

print answer
assert answer == 20492570929