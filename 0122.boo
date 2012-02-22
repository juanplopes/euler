/*
This problem is known as shortest addition chain. And is NP-complete.

First, I guessed all the numbers up to 200 could be represented in less than
15 multiplications. Then I made a backtrack to try combinations in a special
way. Every add must be done with a value already on the buffer, and it should
always be at least equal in length with the best already found. E.g.

1 2 4 5

If the buffer is like the above, the only options for the 5th number are:

6 = 5+1
7 = 5+2
9 = 5+4
10 = 5+5

This way, every step adds only 1 multiplication to result, as all the factors
are already calculated before.
*/
import System
import System.Linq.Enumerable

T = array(int, 201)
V = array(int, 15)

def backtrack(k as int):
    if k>=15: return
    for i in range(k):
        V[k] = V[k-1]+V[i]
        if V[k] <= 200 and k<=T[V[k]]:
            T[V[k]] = k
            backtrack(k+1)

        
for i in range(2,201):
    T[i] = 1000
        
V[0] = 1
backtrack(1)
        
answer = T.Take(201).Sum()
print answer
assert answer == 1582