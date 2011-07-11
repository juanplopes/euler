"""
Trivial solution. Using some LINQ, magic, but still trivial.
"""
import System
import System.Linq.Enumerable

sqr = {x as int|x*x}
answer = sqr(range(1, 101).Sum()) - range(1, 101).Sum(sqr)

print answer
assert answer == 25164150