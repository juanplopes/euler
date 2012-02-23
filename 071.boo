/*
Trivial solution. Approaches 2/5 to 3/7 by adding both numberator and 
denominator until the former reaches the maximum.
*/
import System
import System.Linq.Enumerable

an,ad = (2,5)
bn,bd = (3,7)

while ad+bd<=10**6:
    an,ad = (an+bn, ad+bd)
    
answer = an
print answer
assert answer == 428570