/*
Generate next numbers in amicable chain through a sieve-like algorithm.

That is, for each pair of divisors a and b, sum a+b to a*b. Be careful with
the squares.

Then, find all the strongly connected components through the classic algorithm
and get the greater of them and find the minimum value in it.
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
