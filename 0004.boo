import System.Linq.Enumerable

def convert(n as int):
	while(n>0):
		yield n%10
		n/=10

def is_palindrome(x):
	return convert(x).SequenceEqual(convert(x).Reverse())

numbers = [a*b for a in range(100, 1000) for b in range(a, 1000)]

answer = numbers.Cast[of int]().Distinct().Where(is_palindrome).Max()

print answer
assert answer == 906609