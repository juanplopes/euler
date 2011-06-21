import System
import System.Linq.Enumerable

reverse = {n|Convert.ToDecimal(string(n.ToString().Reverse().ToArray()))}

is_lychrel = {n as decimal| range(50).Select({x| n = n + reverse(n)}).All({x| x != reverse(x)})}

answer = range(10000).Count(is_lychrel)

assert answer == 249
print answer