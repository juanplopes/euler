"""
Create all possible fractions in form XX/YY. Check for special property
eliminating trivial cases. Saves the product into aa/bb. Then, reduces the
fraction using GCD.
"""
import System
import System.Linq.Enumerable

def is_special(x as int, y as int):
	a, b = (x / 10, x % 10)
	c, d = (y / 10, y % 10)
	if (b == 0 and d == 0 or x==y): return false
	if a == c and d > 0: return cast(decimal, x)/y == cast(decimal, b)/d
	if a == d and c > 0: return cast(decimal, x)/y == cast(decimal, b)/c
	if b == c and d > 0: return cast(decimal, x)/y == cast(decimal, a)/d
	if b == d and c > 0: return cast(decimal, x)/y == cast(decimal, a)/c
	return false

def gcd(a as int, b as int):
	while(b): a, b = (b, a%b)
	return a;

aa = 1
bb = 1
for a in range(10, 100):
	for b in range(a, 100):
		if is_special(a, b):
			aa *= a
			bb *= b

answer = bb / gcd(aa,bb)
print answer
assert answer == 100