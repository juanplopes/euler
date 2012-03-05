/*
The trick is, given the set is ordered and the elements are unique (to respect
second rule), if every element in set B has a corresponding greater element at
C, we do not need to test, as we know its sum is strictly lesser than C.

For example, given the hypotetical set
A = (1, 2, 3, 4) (that do not respect second rule, but it's just an example).

If B = (1, 2) and C = (3, 4), we know that S(B) != S(C) because every element
of B has a corresponding greater at C (1<3 and 2<4).

We represent here the sets as a bitmask from 1 to 2^size. The need_count 
calculates the "balance" in the bit appearances in each bitmask. If the
greater number appears with one bit without any corresponding bit on the
lesser, we say it need to be checked for equality.
*/
import System
import System.Linq.Enumerable

def need_count(m1 as int, m2 as int):
    if m1&m2: return false
    
    c1,c2,b=0,0,0
    neg=false

    while m1 or m2:
        if m1&1:
            c1+=1
            b-=1
        if m2&1:
            c2+=1
            b+=1
        if b>0: neg=true
        m1>>=1
        m2>>=1
        
    return c1==c2 and c1!=1 and neg

answer = 0
for a in range(1,2**12):
    for b in range(a+1,2**12):
        if not a&b and need_count(a,b):
            answer += 1


print answer
assert answer == 21384
