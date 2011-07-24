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
    for d in range(100):
        for k in range(25):
            p = BigInteger(d).Pow(k)
            if have_property(p, d): yield p

list = A().Distinct().OrderBy({x|(x)}).Skip(10).ToList()
            
answer = list[29]
print answer
assert answer == 248155780267521