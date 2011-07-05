import System
import System.Linq.Enumerable
import EulerTools from boot

def is_bouncy(n as int):
	if n < 100: return false
	a,b = (0,0)
	
	while a==b and n > 0:
		a, b = (n % 10, n / 10 % 10)
		n /= 10
		dir = a>b and 1 or 0

	while n > 0:
		c = n%10
		if dir == 1 and b<c: return true
		if dir == 0 and b>c: return true
		a,b = (b,c)
		n/=10
	return false

c = 0
i = 0
for i in range(1, int.MaxValue):
	if is_bouncy(i): c+=1
	if cast(decimal, c)/i >= 0.99: break
	
answer = i
print answer
assert answer == 1587000