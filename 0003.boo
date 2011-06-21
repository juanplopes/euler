import System
import System.Linq.Enumerable

is_prime = {n as long|range(2,Math.Sqrt(n)+1).Count({x as long|n%x==0})==0}
factors = {n as long|range(2,Math.Sqrt(n)+1).Where(is_prime).Where({x as long|n%x==0})}
answer = factors(600851475143).Max()

print answer
assert answer == 6857