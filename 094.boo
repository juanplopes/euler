/*
Reference 
from: http://oeis.org/A103974
to: http://oeis.org/A120893

Says that: 
a(n)=2*{2*a(n-1) + (-1)^n} - a(n-2) ; a(0)=1,a(1)=1.

Just create the program to generate the sequence
*/
import System
import System.Linq.Enumerable

answer = 0L
p, q = 1, 1
for i in range(int.MaxValue):
    p,q= 4*p + 2*Math.Pow(-1, i) - q, p
    a = p
    b = a + Math.Pow(-1, i)
    if 2*a+b > 10**9: break
    answer += 2*a+b

print answer
assert answer == 518408346