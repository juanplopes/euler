/*
Dynamic programming solution:

To calculate T[n], the number of solutions for n units, we will try to put "j" 
consecutive blocks starting at the position "k". And then solve the problem for 
T[n-j-k-1]. -1 because two groups of blocks must have one space between.
*/
import System
import System.Linq.Enumerable

T = array(long, 51)

for i in range(0,3): T[i] = 1

for i in range(3, 51):
    T[i] = i - 1
    for j in range(3, i):
        for k in range(0, i-j):
            T[i] += T[i-j-k-1]
            
answer = T[50]
        
print answer
assert answer == 16475640049