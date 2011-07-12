/*
It is easy to prove that every number less than ten million is reduced to less
than 600 in the first iteration. What we do is to calculate where every number
less than 600 will lead to (with all the iterations).

Then, to know where each number up to ten million will lead (with only one
iteration) we use a dynamic programming that stores in T[i, j], how many 
numbers with upto "i" digits will lead to "j" after its first iteration. 
It iterates in the number digits [1..7] and the possible number for each 
position [0..9], instead of the number itself.

So, for each number "i" less than 600, we sum T[7, i] if lead_to[i] == 89.
*/
import System
import System.Linq.Enumerable

def ends_in(a as int) as int:
	if (a==0): return 1
	sum = 0
	while a not in (1, 89):
		sum = 0
		while(a):
			sum += (a%10)**2
			a/=10
		a = sum
	return a

lead_to = range(600).Select(ends_in).ToArray()
T = matrix(int, 8, 600)
T[0, 0] = 1

for i in range(1,8):
	for j in range(10):
		for k in range(600-j*j):
			T[i, k+j*j] = T[i, k+j*j] + T[i-1, k]


answer = 0
for i in range(600):
	if (lead_to[i] == 89):
		answer += T[7, i]
print answer
assert answer == 8581146