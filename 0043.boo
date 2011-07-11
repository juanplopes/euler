import System
import System.Linq.Enumerable

primes = (1, 2, 3, 5, 7, 11, 13, 17)
value = array(int, 10)
used = array(bool, 10)

def valid_for(d as int):
	return d<2 or (value[d-2] * 100 + value[d-1] * 10 + value[d]) % primes[d-2] == 0

def make_BigInteger():
	r as long = 0
	for i in range(10):
		r = r*10+value[i]
	return r
	
def count(d as int) as long:
	if d >= 10: 
		return make_BigInteger()
	
	sum as long = 0
	for i in range(10):
		if not used[i]:
			value[d] = i
			used[i] = true
			if valid_for(d): 
				sum += count(d+1)
			used[i] = false
	return sum
			
answer = count(0)
	
print answer
assert answer == 16695334890