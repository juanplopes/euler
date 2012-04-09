/*
We define the recurrence T(n,a,b) as "how many n-digit numbers ending in ab
satisfy the required property". Given we know the answer for any T(n-1,i,a)
(the recurrence assumption), the answer is the sum of every valid value of i
(i.e, i+a+b <= 9) for n-1 digits. Simplified:

T(0,0,0) = 1
T(1,0,0) = 0 //to ensure no number has leading 0
T(n,a,b) = sum(0<=i<=9, T(n-1,i,a))
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
