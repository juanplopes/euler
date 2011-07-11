import System
import System.Linq.Enumerable

def kth_permutation(n as int, k as int):
	data = array(int, n)
	for j in range(1, n+1):
		data[n-j] = (k % j + 1)
		k /= j

	data[n-1] = 1
	for i in range(n-2, -1):
		for j in range(i+1, n):
			if data[j] >= data[i]: data[j] += 1
	num = 0
	for i in range(0, data.Length):
		num = num*10+ data[i]
	return num

primes = PrimeNumbers()
def answer_with_n_digits(n as int):
	#362880 is the best value, because mods with up-to-9 well
	permutations = range(362880-1, -1).Select({x as int|kth_permutation(n,x)})
	return permutations.Where(primes.IsPrime).First()	
	
answer = answer_with_n_digits(7) #try with 9 and 8... nothing
print answer
assert answer == 7652413