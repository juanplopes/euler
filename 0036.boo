import System
import System.Linq.Enumerable

def terms(a as int, base as int): 
	while a>0:
		yield a%base
		a/=base

def is_palindromic(a as int):
	if (a&1==0): return false
	t10 = terms(a, 10)
	if not t10.SequenceEqual(t10.Reverse()): return false
	t2 = terms(a, 2)
	if not t2.SequenceEqual(t2.Reverse()): return false
	return true
	
		
answer = range(1000000).Where(is_palindromic).Sum()
		
print answer
assert answer == 872187