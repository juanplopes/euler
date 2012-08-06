/*
The equation:

sqrt(a^2 - (b/2)^2) = b+-1 

Can be writen as:

4a^2 - 5b^2 - 8b - 4 = 0

Which is a diophantine equation. I use http://www.alpertron.com.ar/QUAD.HTM to 
solve. It's solution is:

X0 = -1, 0    Y1 = 1, 0

Xn+1 = P Xn + Q Yn + K
Yn+1 = R Xn + S Yn + L

P = -9
Q = -8
K = -8, 8
R = -10
S = -9
L = -8, 8

Note:

px, py - results for +1
lx, ly - results for -1
*/
import System
import System.Linq.Enumerable
import System.Math

px, py = BigInteger(0), BigInteger(1L)
lx, ly = BigInteger(0), BigInteger(-1L)

answer = 0L
for i in range(12):
    px, py = -9*px -8*py -8, -10*px - 9*py -8
    if px > 0 and py > 0:
        answer += py
    
    lx, ly = -9*lx -8*ly +8, -10*lx - 9*ly +8
    if lx > 0 and ly > 0:
        answer += ly

print answer
assert answer == 1118049290473932L
