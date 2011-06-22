import System.Linq.Enumerable
def fibs():
	a,b=(0,1)
	while(true):
		a,b=(a+b,a); 
		yield a

is_even = {x as int|x%2==0}
less_than = {x as int|x<=4000000}
answer = fibs().Where(is_even).TakeWhile(less_than).Sum()

print answer
assert answer == 4613732