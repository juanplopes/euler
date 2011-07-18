/*
Simple sieve to sum all the divisors for each value. Only computes divisors 
up to sqrt(L), because of the pairity of the divisors.

Then the answer is found by searching for all computed values that meets the
criteria.
*/
import System
import System.Linq.Enumerable

def build(dices as int, max as int):
    P = matrix(decimal, dices+1, 2*max*dices)
    P[0,0] = cast(decimal, 1)
    p = cast(decimal, 1.0)/max
    for i in range(1, dices+1):
        for j in range(0, dices*max+1):
            for k in range(1, max+1):
                P[i,j+k] = P[i,j+k] + P[i-1,j] * p
    return P

P = build(9, 4)
C = build(6, 6)

prob as decimal = 0

for i in range(9, 37):
    d as decimal = 0
    for j in range(6, i):
        d += C[6, j]
    prob += P[9, i] * d
answer = Math.Round(prob, 7)
print answer
assert answer == 0.5731441