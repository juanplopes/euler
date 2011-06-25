import System
import System.Linq.Enumerable

primes = (2, 3, 5, 7, 11, 13, 17)

def kth_permutation(k as int):
	n = 10
	data = array(int, n)
	for j in range(1, n+1):
		data[n-j] = (k % j)
		k /= j

	data[n-1] = 0
	for i in range(n-2, -1):
		for j in range(i+1, n):
			if data[j] >= data[i]: data[j] += 1
	num as long = 0
	for i in range(0, data.Length):
		num = num*10+ data[i]
	return num

def have_property(n as long):
	s = n.ToString("0000000000")
	return range(7).All({i as int| int.Parse(s[i+1:i+4]) % primes[i] == 0})


answer = range(3628800).Select(kth_permutation).Where(have_property).Sum()
	
print answer
assert answer == 16695334890