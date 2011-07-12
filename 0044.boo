"""
Generate all pentagonal numbers upto 2500 and store in a hashtable. Then verify
all pairs whose sum and difference are also pentagonal (using the hashtable).
Get the minimum absolute value.
"""
import System
import System.Collections.Generic
import System.Linq.Enumerable

def p(n as int):
	n++
	return n*(3*n-1)/2
	
P = HashSet[of int](range(2500).Select(p).ToArray())

pairs = [Math.Abs(j-k) 
	for j in P 
	for k in P 
	if P.Contains(k-j) and P.Contains(j+k)]

answer = pairs.Min()
		
print answer
assert answer == 5482660