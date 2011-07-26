/*
We'll split this problem by the number of digits. 

Almost every digit have another associated digit that we call a pair. 12345's 
reverse is 54321. So (1,5), (4,2) (3,3) as groups of numbers. Please note that 
if a pair sums more than 9, we must treat the carry. Every carry comes in pairs, 
as the numbers. 33337+73333 will generate two carries for the same pair, for 
example. Note also that a carry always affects two different pairs, as it goes 
always from right to left.

So, if you have ABCDE+EDCBA, a carry with B+D will affect either C+C and A+E, 
but only one of them, that's why 5 digit solutions cannot exist.

Essentially, we have, 2 kinds of numbers, odd and even. 

The even are easy, as the carries always goes in pairs, they are the most 
affected, because there is no central piece to to deposit the carry from the 
right half. So, all their pairs must sum less than 10 and be odd. The outer
digits must also be different of 0 (because it must have exactly n digits). 
20 possible pairs in outer numbers, 30 in the inner. Final formula: 

20*30^((n-1)/2)

The odd are a little more complicated. The center is always even, so we must
force a carry from nearest digit of the right side. But it'll cause a carry on 
the nearest digit on the left side, and it is dangerous. We must play with odd 
and even pairs to make this happen. But if one of sides is even, that
becomes complicated, because

OEOE C EOEO

See that if we have pair-digit sides, we cannot make the same odd-even plan for
both sides? They aren't really symetric as odd-digit sides, see

OEOEO C OEOEO

So, we can infer that for 2(2k)+1 there is no possible solution, but we can
focus on 2(2k)+3 (like the above)

For this to happen, like said before, the center must receive carry from the
right side. But it should not carry. All odd pairs must carry and all even
pairs must not carry. For odd sum with carry, 20 possibilities, for even sum
without carry, 25 possibilities. The outer pair must be odd and with carry, but
different of 0 (to be n-digit). 20 possibilities, as the 2n solution. The center 
must only not carry, as it is the same number twice, we have a 5 (0..4). 

So at the end, we have

20 * 5 * (20 * 25) ^ k or
20 * 5 * (20 * 25) ^ (n/4)
*/

import System
import System.Linq.Enumerable

def solution_for(n as int):
    if n%2 == 0: return 20*30**((n-1)/2)
    if n%4 == 1: return 0
    if n%4 == 3: return 20*5*(20*25)**(n/4)
    
answer = range(1,10).Sum(solution_for)
print answer
assert answer == 608720