import System
import System.Linq.Enumerable

def ends_in(a as int) as int:
	if (a==0): return 1
	sum = 0
	while a not in (1, 89):
		sum = 0
		while(a):
			sum += (a%10)**2
			a/=10
		a = sum
	return a

lead_to = range(600).Select(ends_in).ToArray()
count = array(int, 600)
count[0] = 1

for i in range(7):
	new_count = array(int, 600)
	for j in range(10):
		for k in range(600):
			if (count[k] > 0):
				new_count[k+j*j] += count[k]
	count = new_count

answer = 0
for i in range(600):
	if (lead_to[i] == 89):
		answer += count[i]
print answer
assert answer == 8581146