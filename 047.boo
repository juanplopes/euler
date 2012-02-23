/*
Cheat: store in K[i] the number of prime factors of each number i

Get the first of a sequence with exactly 4 prime factors. They'll be distinct.

Trust me.
*/
import System
import System.Linq.Enumerable
import System.Collections.Generic

primes = PrimeNumbers()
K = array(int, 134043+4)

for p in primes.Until(K.Length/2):
    for i in range(p*2, K.Length, p):
        K[i]+=1

answer=0
while(true):
    answer+=1
    a,b,c,d = range(answer, answer+4).Select({x as int|K[x]}).ToArray()
    if (a==4 and b==4 and c==4 and d==4):
        break

print answer
assert answer == 134043