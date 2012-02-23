/*
Precomputes the probability of throwing i dice and the result summing j as an
array P[i,j]. Calculates for build(9,4) "9 dice of 4 sides" and build(6,6), 
analogous.

Then, for each possible throw of Pete, multiplies by the sum of the probability
of all lesser throws of Colin.
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