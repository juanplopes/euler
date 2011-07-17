/*
Classic integer partition recurrence. Uses memoization.
'
p(n,m) means in how many ways can we partition "n" using at most the factor "m".

The "-1" is because the trivial solution "n = n" doesn't count as solution for
this problem.
*/
import System
import System.Linq.Enumerable

T = matrix(int, 101, 101)
for i in range(101):
    T[1, i] = 1

def p(n as int, m as int) as int:
    if (n<0): return 0
    if (n==0): return 1
    if (T[n,m]!=0): return T[n,m]

    for i in range(1, m+1):
        T[n,m] = T[n,m] + p(n-i, i)
        
    return T[n,m]
    
answer = p(100, 100) - 1
print answer
assert answer == 190569291