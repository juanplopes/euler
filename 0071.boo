import System
import System.Linq.Enumerable


an,ad = (2,5)
bn,bd = (3,7)

while ad+bd<=1e6:
	an,ad = (an+bn, ad+bd)
	
answer = an
print answer
assert answer == 428570