/*
We try to generate the shortest password by checking, for every char, if it
already matches the current password. A greed algorithm. If not, we put it where
it belongs: before or after or inside the current one.
*/
import System
import System.Linq.Enumerable

A = (129,160,162,162,168,180,289,290,316,316,318,318,319,319,319,319,362,368,380,389,620,629,680,680,680,689,689,690,710,710,710,716,716,718,719,720,728,729,729,729,729,729,731,736,760,762,762,769,790,890)

s = A[0].ToString();

for i in range(1, A.Length):
	s2 = A[i].ToString();
	if s[0]==s2[2]:
		s = s2 + s[1:]
	elif s[s.Length-1]==s2[0]:    
		s += s2[:2]
	elif s[:2]==s2[1:]:  
		s = s2[0] + s
	elif s[s.Length-2:]==s2[:2]: 
		s += s2[2]
	else: 				  
		s = s.Replace(s2[0]+""+s2[2], s2)

answer = int.Parse(s)
	
print answer
assert answer == 73162890