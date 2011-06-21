import System.Linq.Enumerable
a, b = (0, 1)
next_fib = {x as int|a,b=(a+b,a); return a}
is_even = {x as int|x%2==0}
less_than = {x as int|x<=4000000}
answer = range(int.MaxValue).Select(next_fib).Where(is_even).TakeWhile(less_than).Sum()

print answer
assert answer == 4613732