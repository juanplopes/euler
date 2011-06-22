import System
import System.Linq.Enumerable

def is_prime(n as long):
	return range(2,Math.Sqrt(n)+1).Count({x as long|n%x==0}) == 0

def factors(n as long):
	for x in range(2,Math.Sqrt(n)+1).Where(is_prime):
		if n%x==0: yield x

answer = factors(600851475143).Max()

print answer
assert answer == 6857