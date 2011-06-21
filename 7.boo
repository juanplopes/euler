import System
import System.Linq.Enumerable

is_prime = {n as long|range(2,Math.Sqrt(n)+1).Count({x as long|n%x==0})==0}

print range(2,int.MaxValue).Where(is_prime).Skip(10000).First()