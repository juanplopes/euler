/*
The problem states that (b/n)*((b-1)/(n-1))=1/2 and asks you to find the
integer solutions to this equation.

Manipulating a little, we can get:

2b²-2b = n²-n <=>
2b²-2b-n²+n=0

That is a quadratic diophantine equation. I solved it using the site below.

http://www.alpertron.com.ar/QUAD.HTM

It gave me the recurrence

X0 = 1
Y0 = 1

Xn+1 = 3 Xn + 2 Yn - 2
Yn+1 = 4 Xn + 3 Yn - 3

Then I just implemented it.
*/
import System
import System.Linq.Enumerable

b,n=1L,1L
while n<=1000000000000L:
    b,n = 3*b+2*n-2, 4*b+3*n-3
    
answer = b
print answer
assert answer == 756872327473