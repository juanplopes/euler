import System.Linq.Enumerable

def is_magical(x as int):
	return range(1, 21).All({y as int|x%y==0})

answer = range(1, int.MaxValue).First(is_magical)

print answer
assert answer == 232792560