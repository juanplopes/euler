/*
Just follow the rule to create all the fractions. n is the numerator (without
the 1 +) d is the denominator.
*/
import System
import System.Linq.Enumerable

def num_digits(n as BigInteger):
    return n.ToString().Length

n = BigInteger(1)
d = BigInteger(2)

answer = 0
for i in range(1000):
    if num_digits(n+d) > num_digits(d):
        answer+=1
    n, d = (d,n+d*2)
        
print answer
assert answer == 153