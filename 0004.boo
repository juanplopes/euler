/*
Define is_palindrome predicate, by decomposing and recomposing reverselly.
Then solve the rest by brute force.
*/
import System.Linq.Enumerable

def is_palindrome(n as int):
	a = 0
	while(n>0):
		a = a*10+ n%10
		n/=10
		if (a==n): return true
	return false

numbers = [a*b for a in range(100, 1000) for b in range(a, 1000)]

answer = numbers.Cast[of int]().Distinct().Where(is_palindrome).Max()

print answer
assert answer == 906609