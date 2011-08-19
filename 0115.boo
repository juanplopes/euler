/*
Dynamic programming solution (related to 114):

To calculate T[n], the number of solutions for n units, we will try to put "j" 
consecutive blocks starting at the position "k". And then solve the problem for 
T[n-j-k-1]. -1 because two groups of blocks must have one space between.
*/
import System
import System.Linq.Enumerable

L = 200
M = 50
T = array(long, L)

for i in range(0,M): T[i] = 1

for i in range(M, L):
    T[i] = i-M+2
    for j in range(M, i):
        for k in range(0, i-j):
            T[i] += T[i-j-k-1]
            

for i in range(L):
    if T[i] > 10**6:
        answer = i
        break

print answer
assert answer == 168