import System.Linq.Enumerable

def is_palindrome(x):
	return x.ToString().Reverse().SequenceEqual(x.ToString())

numbers = [a*b for a in range(100, 1000) for b in range(100, 1000)]

answer = numbers.Cast[of int]().Where(is_palindrome).Max()

print answer
assert answer == 906609