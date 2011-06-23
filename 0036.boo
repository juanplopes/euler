import System
import System.Linq.Enumerable

def terms(a as int, base as int): 
	while a>0:
		yield a%base
		a/=base

def is_palindromic(a as int):
	t10 = terms(a, 10)
	t2 = terms(a, 2)
	return t10.SequenceEqual(t10.Reverse()) and t2.SequenceEqual(t2.Reverse())
		
answer = range(1000000).Where(is_palindromic).Sum()
		
print answer
assert answer == 872187