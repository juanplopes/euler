/*
Recursive solution with memoization. Each recursion step constructs the next
number and checks for the solution to it.

Define the known solutions for problem stated numbers, they're the only stop
cases.
*/
import System
import System.Linq.Enumerable
    
F = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880)
T = array(int, 3e6)
T[169] = 3
T[1454] = 3
T[363601] = 3
T[871] = 2
T[45361] = 2
T[872] = 2
T[45362] = 2

def count(n as int) as int:
    if T[n] > 0: return T[n]
    d = n
    s = 0
    while(d>0):
        s+=F[d%10]
        d/=10
    if (s==n): r = 1
    else: r = count(s) + 1
    T[n] = r
    return r

answer = range(1e6).Where({x as int|count(x)==60}).Count()
print answer
assert answer == 402