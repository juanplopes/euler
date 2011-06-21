import System
import System.Linq.Enumerable

sqr = {x as int|x*x}
print sqr(range(1, 101).Sum()) - range(1, 101).Select(sqr).Sum()