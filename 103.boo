/*
We use the answers from 105 and 106 to calculate this answer. So please, see
them first.

We backtrack through all possible sets, pruning some extreme conditions, to
verify if it forms a special sum set, then we check if it is minimum.
*/
import System
import System.Linq.Enumerable

K = List[of (int)]()

def need_count(a as int, b as int):
    if a&b: return false
    
    ca,cb,balance=0,0,0
    need=false

    while a or b:
        if a&1:
            ca+=1
            balance-=1
        if b&1:
            cb+=1
            balance+=1
        if balance>0: 
            need=true
        a>>=1
        b>>=1
        
    return ca==cb and ca!=1 and need
    
def property1(A as (int)):
    begin,end=A[0],0
    for i in range(1, (A.Length-1)/2+1):
        begin += A[i]
        end += A[A.Length-i]
        if begin <= end:
            return false 
    return true

def property2(A as (int)):
    for b, c in K:
        sb,sc,i = 0, 0, 0
        while b or c:
            if b&1: sb += A[i] 
            if c&1: sc += A[i]
        
            i += 1
            b >>= 1
            c >>= 1
        if sb==sc: return false
    return true

def property(A as (int)):
    return property1(A) and property2(A)

L = 7
for a in range(1,2**L):
    for b in range(a+1,2**L):
        if need_count(a,b):
            K.Add((a,b))

T = array(int, L)
minn = int.MaxValue
answer = 0L

def backtrack(k as int, s as int) as void:
    if k==L:
        if property(T) and s<minn:
            answer = long.Parse(string.Join("", T.Select({x|x.ToString()}).ToArray()))
            minn = s
        return    

    start = (T[k-1] if k>0 else 0)+1
    end = (T[0] + T[1] if k>1 else 32)
    for i in range(start, end):
        T[k] = i
        backtrack(k+1, s+i)
    
backtrack(0,0)

print answer
assert answer == 20313839404245
