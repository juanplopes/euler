/*
Defines is_palindrome predicate. 

Then precalculates S[i] as "the sum of all squares from 0 to i"

Then, for each pair i,j with i+2 <= j, verify if S[j] - S[i] "the sum of all
squares between i+1 and j" is a palindrome.

Remeber all values already summed in T[v]
*/
import System
import System.Linq.Enumerable

def is_palindrome(n as int):
    a, d = 0, n
    while n:
        a = a*10 + n%10
        n/=10
    return a == d

S = array(long, 1e4)
for i in range(1, 1e4):
    S[i] = S[i-1] + i*i

total = 0L
T = array(bool, 1e8)
for i in range(1e4-2):
    for j in range(i+2, 1e4):
        v = S[j] - S[i]
        if v >=1e8: break
        if not T[v] and is_palindrome(v):
            T[v] = true
            total+=v

answer = total.ToString()
print answer
assert answer == '2906969179' #long literal bug =/