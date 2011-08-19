/*
Semi brute force.

Fact: Since the square ends in 0, it is divisible by 10. So, the base must also.
We can assume then that the answer ends in "0". So, the square itself will be
divisible by 100, ie, will end in "00"

In this algorithm, we try to generate possible square roots for the target
number. We try all numbers in form 1a2b3c4xxxxxxxxxx00 where x sequence can be
any number. We map the first and the last square roots that results in each
pattern and iterate through the values. The yield n*10 is because of the fact
above.
*/
import System
import System.Linq.Enumerable

expected = (1,2,3,4,5,6,7,8,9,0)

def is_answer(n as long):
    i = 10
    n = n*n
    while n:
        if n%10 != expected[i-1]: return false
        n/=100
        i--
    return i==0

def candidates():
    for a in range(0,10):
        for b in range(0,10):
            for c in range(0,10):
                base = (1020304+a*10**5+b*10**3+c*10**1) * 10**10L
                start = Math.Sqrt(base) cast long
                end = Math.Sqrt(base+10**10) cast long
                for n as long in range(start,end):
                    yield n*10

answer = candidates().First(is_answer)
print answer
assert answer == 1389019170