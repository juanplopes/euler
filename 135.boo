/*
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

def testd(a as int, b as int):
    return (1 if 3*a>b and (a+b)%8==0 and (a-b)%2==0 else 0)

def testn(a as int, n as int):
    if n%a!=0: return 0
    b = n/a
    if a==b: return testd(a,b)
    return testd(a,b)+testd(b,a)

def test(n as int):
    return range(1,Math.Sqrt(n)+1).Select({a|testn(a,n)}).Sum() == 10

answer = 0
for n in range(1,1000000):
    if test(n*4):
        answer+=1
print answer
assert answer == 4989
