/*
Backtrack to create all possible reverse polish expressions.

Digits 10..13 represents the operations. So, the following expressions are
equivalent:

1 2 10 3 4 12 13 <=> 1 2 + 3 4 * / <=> (1 + 2) / (3 * 4)

Gotta be careful to add at most 4 digits and 3 operators. Also, avoid adding
an operator until there is 2 more digits than operators (to have what to
operate).

Then just executes the expression using a stack.
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

T = array(int, 1000001)
T2 = array(int, 1000001)

for i in range(T.Length):
    T[i]+=1

for a in range(2, 1001):
    T[a*a]+=a
    b=a+1
    while a*b < T.Length:
        T[a*b]+=a+b
        b+=1
for i in range(T.Length):
    if T[i] < T.Length:
        T2[T[i]]=i

V = array(int, T.Length)
O = array(int, T.Length)
C = array(int, T.Length)   
   
maxv, maxx, count = 0,0,0

def dfs1(v as int) as void:
    V[v] = 1
    u = T[v]
    if u<T.Length and not V[u]: dfs1(u)
    O[count+=1]=v

def dfs2(v as int, c as int) as void:
    V[v] = c
    C[c] += 1
    u = T[v]
    if u<T.Length and not V[u]: dfs2(u, c)

        
for i in range(1, T.Length):
    if not V[i]:
        dfs1(i)
V = array(int, T.Length)
for i in range(1, T.Length):
    if not V[O[i]]:
        dfs2(O[i], O[i])

for i in range(T.Length):
    if C[V[i]] > maxx:
        maxx = C[V[i]]
        maxv = i
        
answer = maxv
print answer
assert answer == 14316
