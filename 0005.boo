import System.Linq.Enumerable

answer = range(1, int.MaxValue).Where({x as int|range(1, 21).All({y as int|x%y==0})}).First()

print answer
assert answer == 232792560