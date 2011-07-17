/*
The minimum ratio n/phi(n) is achieved by having the greatest possible primes.
Ths trivial case would be n being a prime number. But, phi(p) = p-1, and p-1
would never be a permutation of p. So, the second case is n being a product
of two primes p and q. So, it's phi will be (p-1)(q-1).

Try, for every pair of primes, every product that leads to a permutated phi and
checks for the minimum ratio.
*/
import System
import System.Linq.Enumerable

primes = PrimeNumbers()

def same_digits(a as long, b as long):
    digits = array(int, 10)
    while(a>0): digits[a%10]++; a/=10
    while(b>0): digits[b%10]--; b/=10
    return digits.All({x|x==0})

min as double = int.MaxValue
    
for p in primes.Until(4000):
    for q in primes.Until(4000):
        r = p*q
        if (r >= 1e7): break
        phi = (p-1)*(q-1)
        if same_digits(r, phi):
            d = r/cast(double, phi)
            if d < min:
                min = d
                answer = r
print answer
assert answer == 8319823