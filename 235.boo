/*
Clever backtrack. Try, for each digit backwards fixing number of required 
repetitions (tr).

Then backtrack in a way that you only generate numbers with the correct
ammout of repeated digits.
*/
import System
import System.Linq.Enumerable

def calc(r as double):
    a = 900
    b = 1.0
    s = 0.0
    for k in range(5000):
        a -= 3   
        s += a*b
        b *= r
    return s

a,b=1.0,1.0025

while b-a>0.0000000000000005:
    m=(a+b)/2
    v = calc(m)
    if v>-600000000000:
        a = m
    else:
        b = m
answer = Math.Round(a, 12)
print answer
assert answer == 1.002322108633
