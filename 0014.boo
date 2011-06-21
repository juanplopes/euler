import System
import System.Linq.Enumerable

seq = {n as long|range(int.MaxValue).Select({i as int| (n&1 and n=3*n+1) or n/=2 }).TakeWhile({i|i!=1})}
value = {n as long|seq(n).Count()}

answer = range(1,1000000).Select(Convert.ToInt64).OrderByDescending(value).First()
print answer
assert answer == 837799