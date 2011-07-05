import System
import System.Linq.Enumerable

INC = matrix(long, 100, 10)
DEC = matrix(long, 100, 10)

for i in range(10):
	INC[0, i] = 1
	DEC[0, i] = 1


for i in range(1, 100):
	for j in range(10):
		for k in range(j, 10): INC[i,j] = INC[i,j] + INC[i-1,k]
		for k in range(j, 0): DEC[i,j] = DEC[i,j] + DEC[i-1,k]

answer as decimal = 0
for i in range(100):
	for j in range(10):
		answer += INC[i, j] + DEC[i, j] 
	answer -= 10
answer -=1
	
print answer
assert answer == 51161058134250