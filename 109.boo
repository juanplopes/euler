/*
Brute-force all possible combinations, since there are few.

Just being careful to make the two first shots order-independent and the last
one only uses doubles.
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

normal = List[of int]()
ending = List[of int]()

normal.Add(0)
normal.Add(25)
normal.Add(50)
ending.Add(50)
for i in range(1, 21):
    normal.Add(i)
    normal.Add(i*2)
    normal.Add(i*3)
    ending.Add(i*2)

answer = 0
for i in range(normal.Count):
    for j in range(i, normal.Count):
        for k in range(ending.Count):
            if normal[i] + normal[j] + ending[k] < 100:
                answer += 1
print answer
assert answer == 38182
