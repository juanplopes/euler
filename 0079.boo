import System
import System.Linq.Enumerable
import EulerTools from boot

attempts = (129,160,162,162,168,180,289,290,316,316,318,318,319,319,319,319,362,368,380,389,620,629,680,680,680,689,689,690,710,710,710,716,716,718,719,720,728,729,729,729,729,729,731,736,760,762,762,769,790,890)

def matches(a as int, b as int):
	while(a>0):
		if (b%10 == a%10): b/=10
		a/=10
	return b==0

answer = range(int.MaxValue).First({x as int|attempts.All({y|matches(x,y)})})
	
print answer
assert answer == 73162890