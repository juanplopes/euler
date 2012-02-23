/*
Dynamic Programming over T, where T[a,b,c] is "how many prize strings are there
with 'a' days, 'b' lates and ending in 'c' absents"?
*/
import System
import System.Linq.Enumerable

T = matrix(int, 31, 2, 3)

T[0,0,0] = 1

for i in range(30):
    for j in range(2):
        for k in range(3):
            T[i+1, j, 0] = T[i+1, j, 0] + T[i,j,k]
            if j+1 < 2:
                T[i+1, j+1, 0] = T[i+1, j+1, 0] + T[i,j,k]
            if k+1 < 3:
                T[i+1, j, k+1] = T[i+1, j, k+1] + T[i,j,k]

answer = 0
for i in range(2):
    for j in range(3):
        answer += T[30, i, j]
print answer
assert answer == 1918080160
