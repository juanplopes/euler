/*
Calculates sequence size using recurrence and memoization.
Then checks for the greater.
*/
import System
import System.Linq.Enumerable

T = array(int, 1000000)
def seq(n as long) as long:
    if n<T.Length and T[n] > 0: return T[n]
    if (n==0): return 1
    if (n==1): return 0
    if (n&1): d = seq(n*3+1) + 1
    else:       d = seq(n/2) + 1
    if n<T.Length: T[n] = d
    return d
    
max_value = 0
answer = 0

for i in range(1,1000000):
    temp = seq(i)
    if temp > max_value:
        max_value = temp
        answer = i
 
print answer
assert answer == 837799