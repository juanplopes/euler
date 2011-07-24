/*
Constructs all values for function A in an unordered form. Try all possible
powers and check if their results have_property. The upper bounds for d and k
aren't easily proved, but these values (70, 10) can output the 31 first values 
for A.
*/
import System
import System.Linq.Enumerable

def have_property(p as long, d as long):
    s = 0
    while p > 0:
        s += p%10
        p /= 10
    return s == d
    
def A():
    for d in range(2,70):
        for k as long in range(2, 10):
            p = Math.Pow(d, k)
            if p > 1e18: break
            if have_property(p, d) and p >= 10: yield p

list = A().ToList()
list.Sort()
answer = list[29]
print answer
assert answer == 248155780267521