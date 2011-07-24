/*
Brute force solution.

Tries all pairs of squares that are either (even, even) or (odd, odd) to mantain
aspect symmetry.

Treats j backwars to make easy to prune out of range values, because i*i-j*j
grows inverselly in terms of j.

Increases the results array for every subtraction result. Then counts the ones
that are between 1 and 10.
*/
import System
import System.Linq.Enumerable

T = array(int, 1e6+1)

for i as long in range(2, 3e5):
    for j as long in range(i-2, 0, -2):
        v = i*i - j*j
        if v > 1e6: break
        T[v] += 1

answer = T.Count({x|x >= 1 and x <= 10})
print answer
assert answer == 209566