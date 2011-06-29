import System
import System.Collections.Generic
import System.Linq.Enumerable

firsts = Dictionary[of string, long]()
dic = Dictionary[of string, long]()

for i as long in range(10000):
	cube = i**3
	key = string(cube.ToString().OrderBy({x|(x)}).ToArray())
	if dic.ContainsKey(key): 
		dic[key]+=1
		if dic[key] == 5:
			answer = firsts[key]**3
			break
	else:
		firsts[key] = i
		dic[key] = 1
		
print answer
assert answer == 127035954683