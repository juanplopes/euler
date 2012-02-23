/*
Dynamic Programming. Trivial one.
T(x,0) = 1
T(0,y) = 1
T[x,y] = T(x-1, y) + T(x,y+1)
*/
import System
import System.Linq.Enumerable

T = matrix(long, 21, 21)
for i in range(21): 
    T[i,0] = 1
    T[0,i] = 1

for i in range(1,21):
    for j in range(1,21):
        T[i,j] = T[i-1, j] + T[i, j-1]
        
answer = T[20,20]

print answer
assert answer == 137846528820