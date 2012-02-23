/*
The problem's equation is known as Pell's equation.

The fundamental solution is to find the first hi/k1 continued fraction for
sqrt(D) that, letting x = h1 and y = h1, satisfies the equation. That's
guaranteed to be the very first solution.

Uses classic algorithm to generate continued fractions (CF) and calculate
the convergents. Then, check if the value satisfies the equation.
*/
import System
import System.Linq.Enumerable

def CF(n as int):
    n1,d1 =(0,1)
    sqrtn = Math.Sqrt(n)
    while true:
        if d1 == 0: break
        
        nextn = cast(int, (sqrtn + n1) / d1)
        yield nextn
        
        n2, d2 = (d1, n1 - d1 * nextn)
        n3, d3 = (-d2, (n - d2 ** 2) / n2)
        n1, d1 = (n3, d3)

def convergents(n as int):
    b = CF(n).First()
    L = (BigInteger(1),BigInteger(0))
    T = (BigInteger(b),BigInteger(1))
    for i in CF(n).Skip(1):
        yield T
        L, T = (T, (i*T[0]+L[0], i*T[1]+L[1]))

def is_perfect_square(D as int):
    return cast(int,cast(int, Math.Sqrt(D))**2) == D
        
max = BigInteger(0)
for D in range(1001):
    if is_perfect_square(D): continue
    for a,b in convergents(D).Take(100):
        if a*a-D*b*b == 1:
            if a > max:
                max = a
                answer = D
            break

print answer
assert answer == 661
