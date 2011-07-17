/*
Recursive solution that generates all the value and verifies if it's part of the
solution.

e.g. count(1/3,1/2) finds the "center" to be 2/5  and counts how many fractions
there are for (1/3,2/5) and (2/5,1/2) plus 2/5 itself.
*/
import System
import System.Linq.Enumerable

def count(an as int, ad as int, bn as int, bd as int, m as int) as int:
    tn, td = (an+bn, ad+bd)
    if td > m: return 0
    
    ra = count(an, ad, tn, td, m)
    rb = count(tn, td, bn, bd, m)

    return 1 + ra + rb

answer = count(1,3,1,2,12000)
print answer
assert answer == 7295372