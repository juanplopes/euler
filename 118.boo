/*
For every prime number with upto 8 digits, calculate:

"m" the bitmask of the digit ocupation from 0 to 9 for this prime
"c" the digit count of this prime

Store it in a single integer, "c" in the last 4 bits and "m" shifted 4 bits to
the left. 

Discard every prime that contains: (a) zeroes or (b) repeated digits.

Then, for every selected prime, backtrack creating the selected number. Avoid
digits repetition and overflow. Every answer that achieves the 9-digit number is
a hooray!
*/
import System
import System.Linq.Enumerable

def mask_for(p as int) as int:
    c,v,m,r=0,0,0,0
    while p:
        q = p/10
        v = 1<<(p-q*10)
        if v==1 or v&m!=0:
            return 0
        m|=v
        c+=1
        p = q
    return (m<<4) | c

primes = PrimeNumbers(100000000)
mask, count = 0, 0
masks = primes.Cache.Select(mask_for).Where({x|x!=0}).ToArray()

answer = 0
def backtrack(a as int) as void:
    if count==9:
        answer+=1
        return
    
    for i in range(a, masks.Length):
        h = masks[i]
        m,c = h>>4, h&0xF
        if count+c>9: break                 
        if m&mask!=0: continue

        mask|=m
        count+=c
        
        backtrack(i+1)
        
        mask&=~m
        count-=c

backtrack(0)
print answer
assert answer == 44680
