import System
import System.Linq.Enumerable

is_prime = {n as long|range(2,Math.Sqrt(n)+1).Count({x as long|n%x==0})==0}
print range(2, 2000000).Where(is_prime).Select(Convert.ToInt64).Sum()
