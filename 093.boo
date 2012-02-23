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

N = matrix(bool, 10000, 10000)
V = array(bool, 14)
T = array(int, 7)
IMP = -10000000

add = { x as double, y as double | x+y }
sub = { x as double, y as double | x-y }
mul = { x as double, y as double | x*y }
div = { x as double, y as double | (x/y if y!=0 else IMP ) }
all = (add, sub, mul, div)

def back(k as int, numbs as int, ops as int) as void:
    if k==7:
        q = Stack[of double]()
        digits = List[of int]()
        for i in T:
            if i < 10:
                q.Push(i)
                digits.Add(i)
            else:
                a,b=q.Pop(),q.Pop()
                c = all[i-10](b,a)
                if c == IMP: return
                q.Push(c)
        v = q.Pop()
        if v<0 or v != cast(int, v): return
                
        n = 0
        for i in digits.OrderBy({x | return x}):
            n = n*10+i
        N[n,v] = true
                
        return

    if numbs < 4:
        for i in range(1, 10):
            if V[i]: continue
                
            V[i] = true
            T[k] = i
            back(k+1, numbs+1, ops)
            V[i] = false
            
    if numbs-ops >= 2 and ops < 3:
        for i in range(10, 14):
            T[k] = i
            back(k+1, numbs, ops+1)
        
back(0, 0, 0)
    
answer = 0
maxx = 0
for i in range(10000):
    for j in range(1, 10000):
        if not N[i,j]:
            if j > maxx:
                answer = i
                maxx = j
            break
print answer
assert answer == 1258
