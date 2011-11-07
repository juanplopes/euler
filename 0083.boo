import System
import System.Collections.Generic

T = ((131,673,234,103,18),
(201,96,342,965,150),
(630,803,746,422,111),
(537,699,497,121,956),
(805,732,524,37,331))

n = T.Length
V = matrix(bool, n, n)
S = matrix(int, n, n)
for i in range(n):
    for j in range(n):
        S[i,j] = 10000

def update(x as int, y as int, v as int):
    if x<0 or x>=n or y<0 or y>=n: return
    S[x,y] = Math.Min(S[x,y], v+T[x][y])



S[0,0]=T[0][0]
x,y=0,0
while x!=n-1 or y!=n-1:
    minv=10000
    for i in range(n):
        for j in range(n):
            if S[i,j] < minv and not V[i,j]:
                minv, x, y = S[i,j], i, j
    
    V[x,y] = true
    update(x+1, y, minv)
    update(x-1, y, minv)
    update(x, y+1, minv)
    update(x, y-1, minv)

answer = S[x,y]
print answer
assert answer == 42
