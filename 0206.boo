import System
import System.Text
import System.Linq.Enumerable
import EulerTools from boot

def compare(number as decimal):
	str = number.ToString("000000000000000000000000000000")
	a = str.CompareTo("000000000001020304050607080900")
	b = str.CompareTo("000000000001929394959697989990")
	if a==-1: return -1
	if b==1: return 1
	return 0
	
start as decimal = 0
end as decimal = 10e10

while true:
	answer = Math.Floor((start + end) / 2)
	print start, end, answer, compare(answer*answer)
	cmp = compare(answer*answer)
	if cmp == 0: break
	elif cmp == -1: start = answer
	else: end = answer
	#System.Threading.Thread.Sleep(1000)

ns = range(answer, 0).First({x as decimal| compare(x*x)!=0})
print ns
ne = range(answer, int.MaxValue).First({x as decimal| compare(x*x)!=0})
print ns, ne
print answer
assert answer == 45228