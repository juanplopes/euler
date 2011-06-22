import System.Linq.Enumerable

answer = range(1000).Where({x as int|x%5==0 or x%3==0}).Sum()

print answer
assert answer == 233169
