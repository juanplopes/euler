/*
Uses a sieve algorithm to sum all divisors for each number.
For example. For number 2, it jumps 4, 6, 8, etc, adding 2 to divisors sum.
And so on.
*/
import System
import System.Linq.Enumerable

D = array(int, 10000)

for i in range(1, 5000):
	for j in range(i*2, 10000, i):
		D[j] += i

def d(i as int):
	if (i<0 or i>=10000): return -1
	return D[i]

sum = 0
for a in range(2,10000):
	b = d(a)
	if a==d(b) and a != b:
		sum+=a

answer = sum
print answer
assert answer == 31626