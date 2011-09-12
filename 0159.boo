/*
Precalculates all Digital Root Sum (D) up to 1.000.000

Then backtracks all possible increasing factor sequence, checking if its drs
is maximum. Prune the ones that aren't -- they are unable to increase further
values.
*/
import System
import System.Linq.Enumerable

def sum_of_digits(n as int):
    s = 0
    while n:
        s+=n%10
        n/=10
    return s


D = array(int, 10**6)
for i in range(10**6):
    if i < 10:
        D[i] = i
    else:
        D[i] = D[sum_of_digits(i)]

T = D.ToArray()
def backtrack(a as int, n as long, f as int):
    if a < T[n] and n != 1: return

    T[n] = a
    for i in range(f, 500001):
        if n*i >= 1000000: break
        backtrack(a+D[i], n*i, i)

backtrack(0, 1, 2)
        
answer = T.Skip(2).Sum()
print answer
assert answer == 14489159