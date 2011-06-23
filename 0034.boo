import System
import System.Linq.Enumerable

facts = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880)

def terms(a as int): 
	while a>0:
		yield a%10
		a/=10

		
def factall(a as int):
	return terms(a).Select({n|facts[n]}).Sum()

def is_bolado(a as int):
	return a == factall(a)
	
answer = range(3, 100000).Where(is_bolado).Sum()
		
print answer
assert answer == 40730