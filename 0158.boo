/*
1 4 11 26 57
0
325     325
2600    10400    2600
14950   164450   164450   14950
65780   1710280  4341480  1710280  65780
230230  13123110 69529460 69529460 13123110 230230
TODO
*/
import System
import System.Linq.Enumerable

E = array(long, 27)
for n in range(27): 
    E[n] =  2**n - n - 1

C = matrix(long, 27, 27)
for n in range(27):
    for k in range(27):
        if n==k or k==0: C[n,k] = 1 
        elif k>n:        C[n,k] = 0
        else:            C[n,k] = C[n-1,k-1] + C[n-1,k]

answer = 0L
for i in range(3, 27):
    answer = Math.Max(answer, C[26,i]*E[i])
    
print answer
assert answer == 409511334375