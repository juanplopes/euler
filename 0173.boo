/*
Brute force solution.

Tries all pairs of squares that are either (even, even) or (odd, odd) to mantain
aspect symmetry.

Treats j backwars to make easy to prune out of range values, because i*i-j*j
grows inverselly in terms of j.
*/
import System
import System.Linq.Enumerable

answer = 0
for i as long in range(2, 3e5):
    for j as long in range(i-1, 0, -1):
        v = i*i - j*j
        if v > 1e6: break
        if (i%2)!=(j%2): continue
        answer+=1

print answer
assert answer == 1572729