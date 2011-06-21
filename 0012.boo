import System
import System.Linq.Enumerable

triangles = range(1, int.MaxValue).Select({n as int|n*(n+1)/2})
has_five_hundred = {n as int|range(1,Math.Sqrt(n)+1).Where({x as int|n%x==0}).Count() > 250}
answer = triangles.First(has_five_hundred);

print answer
assert answer == 76576500