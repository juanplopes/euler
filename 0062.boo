"""
Generate all cubes of numbers upto a limit. Sort the chars of the string 
representation of the cube and call it the key. Store also who was the first
cube that had this key.

Do it until find a key that is associated to 5 cubes. Call the first cube of
that key the answer.
"""
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
			answer = firsts[key]
			break
	else:
		firsts[key] = cube
		dic[key] = 1
		
print answer
assert answer == 127035954683