"""
Brute force. Try every number. Factorial for 0..9 is cached.
"""
import System
import System.Linq.Enumerable

facts = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880)

def terms(a as int): 
	while a>0:
		yield a%10
		a/=10

		
def factorial_sum(a as int):
	return terms(a).Select({n|facts[n]}).Sum()

def have_property(a as int):
	return a == factorial_sum(a)
	
answer = range(3, 100000).Where(have_property).Sum()
		
print answer
assert answer == 40730