/*
*/
import System
import System.Linq.Enumerable

T = matrix(long, 21, 10, 10)

T[0,0,0] = 1
for n in range(1, 21):
    for a in range(10):
        for b in range(10):
            if n==1 and b==0: continue
            for i in range(10):
                if i+a+b <= 9:
                    T[n,a,b] = T[n,a,b] + T[n-1, i, a] 
                    
answer = 0L
for a in range(10):
    for b in range(10):
        answer += T[20, a, b]

print answer
assert answer == 378158756814587
