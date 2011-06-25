import System
import System.Collections.Generic
import System.Linq.Enumerable

def p(n as int):
	n++
	return n*(3*n-1)/2
	
P = range(2500).Select(p).ToArray()
P2 = HashSet[of int](P)

pairs = [Math.Abs(j-k) 
	for j in P 
	for k in P 
	if P2.Contains(k-j) and P2.Contains(j+k)]

answer = pairs.Min()
		
print answer
assert answer == 5482660