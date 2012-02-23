/*
Check bounciness by not being increasing nor decreasing. Brute force then.
*/
import System
import System.Linq.Enumerable

def is_it(n as int, f as int):
    a = -1
    while n:
        b = n%10
        if a != -1 and f*a > f*b: return false
        a = b
        n/=10
    return true

def is_inc(n as int): 
    return is_it(n, 1)
    
def is_dec(n as int): 
    return is_it(n, -1)
    
def is_bouncy(n as int):
    return not (is_inc(n) or is_dec(n))

c = 0
for i in range(1, int.MaxValue):
    if is_bouncy(i): c+=1
    if (i-c)*100 == i: 
        answer = i
        break
    
print answer
assert answer == 1587000