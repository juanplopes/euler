import System
import System.Linq.Enumerable

def count(an as int, ad as int, bn as int, bd as int, m as int) as int:
	tn, td = (an+bn, ad+bd)
	if td > m: return 0
	
	ra = count(an, ad, tn, td, m)
	rb = count(tn, td, bn, bd, m)

	return 1 + ra + rb

answer = count(1,3,1,2,12000)
print answer
assert answer == 7295372