/*
Recursive solution that generates all the value and verifies if it's part of the
solution.

e.g. count(1/3,1/2) finds the "center" to be 2/5  and counts how many fractions
there are for (1/3,2/5) and (2/5,1/2) plus 2/5 itself.
*/
import System
import System.Linq.Enumerable

expected = (1,2,3,4,5,6,7,8,9)

def is_answer(n as long):
    i = 9
    while n:
        if n%10 != expected[i-1]: return false
        n/=100
        i--
    return i==0

for i as long in range(10101010, 13890267):
    a,b = i*10+3,i*10+7
    if is_answer(a*a):
        answer = a*10
        break
    if is_answer(b*b):
        answer = b*10
        break
    
print answer
assert answer == 1389019170