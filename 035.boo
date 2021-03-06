/*
Rotate numbers by dividing it by 10 and adding the last number multipled by
the log10 of the original number. 

The prime list is initialized with 1 million, to make fast prime checks.

All that remains is brute force.
*/
import System
import System.Linq.Enumerable

pow10 = (1, 10**1, 10**2, 10**3, 10**4, 10**5, 10**6, 10**7, 10**8)
primes = PrimeNumbers(1000000)
def rotate(n as int, log as int):
    return n/10+pow10[log]*(n%10)

def rotations(n as int):
    log = cast(int, Math.Log10(n))
    d = rotate(n, log)
    while(d!=n):
        yield d
        d = rotate(d, log)
    
def is_circular(n as int):
    return rotations(n).All(primes.IsPrime)
    
answer = range(1000000).Where(primes.IsPrime).Where(is_circular).Count()
        
print answer
assert answer == 55