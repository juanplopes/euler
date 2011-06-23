import System
import System.Linq.Enumerable

def kth_permutation(n as int, k as int):
	data = array(int, n)
	for j in range(1, n+1):
		data[n-j] = (k % j)
		k /= j

	data[n-1] = 0
	for i in range(n-2, -1):
		for j in range(i+1, n):
			if data[j] >= data[i]: data[j] += 1
	return data
		
answer as uint = 0 #because of long bug
for i in kth_permutation(10, 999999):
	answer = answer * 10 + i
	 
print answer
assert answer == 2783915460