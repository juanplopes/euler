import System
import System.Linq.Enumerable
import System.Collections.Generic

def digits(a as int):
	while a != 0:
		yield a % 10
		a/=10

def are_same(a as int, b as int):
	return HashSet[of int](digits(a)).SetEquals(digits(b))

def is_sinister(a as int):
	return false unless are_same(a, 2*a)
	return false unless are_same(2*a, 3*a)
	return false unless are_same(3*a, 4*a)
	return false unless are_same(4*a, 5*a)
	return false unless are_same(5*a, 6*a)
	return true
	
answer = range(1, int.MaxValue).First(is_sinister)
	
print answer
assert answer == 142857