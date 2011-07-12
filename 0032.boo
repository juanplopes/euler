/*
Brute force throught all possible mutiplications, keeping track of which have
been used (array P). For each of them that results into a pandigital number,
sums into answer.
*/
import System
import System.Linq.Enumerable

def are_pandigital(a as int, b as int, c as int):
	digits = array(int, 10)
	while(a>0): digits[a%10]+=1;a/=10
	while(b>0): digits[b%10]+=1;b/=10
	while(c>0): digits[c%10]+=1;c/=10
	return digits.Skip(1).All({x|x==1}) and digits[0] == 0
	
P = array(bool, 10000)

answer = 0
for i in range(1,10000):
	for j in range(i, 10000):
		if i*j < P.Length and not P[i*j] and are_pandigital(i, j, i*j):
			answer += i*j
			P[i*j] = true

print answer
assert answer == 45228