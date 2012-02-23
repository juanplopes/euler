/*
We use the principle that (a+b)%n == (a%n+b%n)%n.

So, instead of calculating the entire fibonacci number, we just calculate it's last 9 digits, but
modding all around (to fit in an integer and keep complexity of adding low). Then, for each last 9
digits that are pandigital, we calculate the top 9 digits. We do it by using some log tricks.

OEIS (http://oeis.org/A000045) sais Fibonacci sequence can be written as:

round(phi^n/sqrt(5))

Applying log10 to all of it, we have:

n*log(phi)-log(sqrt(5)

Now, it's just a matter of getting the fractional part of the number and ensure it'll be almost 9.

Then check if it's top9 digits are pandigital.
*/
import System
import System.Linq.Enumerable

phi = (1.0 + Math.Sqrt(5.0))/2.0
logPhi = Math.Log10(phi)
logSqrt = Math.Log10(Math.Sqrt(5.0))

def top9(i as int) as int:
    k = i*logPhi-logSqrt
    return 10**(k - cast(int, k) + 8)

def pandigital(i as int):
    T = array(int, 9)
    while i:
        T[(i%10)-1]++
        i/=10
    return T.All({x|x==1})

a,b=1,0    
for i in range(1,1000000000):
    a,b=(a+b)%1000000000,a
    if pandigital(b) and pandigital(top9(i)):
        answer = i
        break
    
print answer
assert answer == 329468