/*

*/
import System
import System.Linq.Enumerable

def have_property(p as BigInteger, d as BigInteger):
    s = 0
    while p > 0:
        s += p%10
        p /= 10
    return s == d
    
def A():
    for d in range(2,70):
        for k in range(10):
            p = BigInteger(d).Pow(k)
            if have_property(p, d) and p >= 10: yield p

list = A().Distinct().OrderBy({x|(x)}).ToList()
            
answer = list[29]
print answer
assert answer == 248155780267521