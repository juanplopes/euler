import System
import System.Linq.Enumerable

is_prime = {n as long|range(2,Math.Sqrt(n)).Count({x as long|n%x==0})==0}
factors = {n as long|range(2,Math.Sqrt(n)).Where(is_prime).Where({x as long|n%x==0})}
print factors(600851475143).Max()
