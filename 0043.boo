"""
Generate permutations through backtracking, pruning invalid values (valid_for)
during the process. So, the numbers that get to be created by make_number are 
always used to sum it up.
"""
import System
import System.Linq.Enumerable

primes = (1, 2, 3, 5, 7, 11, 13, 17)
value = array(int, 10)
used = array(bool, 10)

def valid_for(d as int):
	return d<2 or (value[d-2] * 100 + value[d-1] * 10 + value[d]) % primes[d-2] == 0

def make_number():
	r as long = 0
	for i in range(10):
		r = r*10+value[i]
	return r
	
def backtrack(d as int) as long:
	if d >= 10: 
		return make_number()
	
	sum as long = 0
	for i in range(10):
		if not used[i]:
			value[d] = i
			used[i] = true
			if valid_for(d): 
				sum += backtrack(d+1)
			used[i] = false
	return sum
			
answer = backtrack(0)
	
print answer
assert answer == 16695334890