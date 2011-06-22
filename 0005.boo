import System
import System.Linq.Enumerable
import EulerTools from boot

primes = PrimeNumbers()

T = matrix(int, 21)

for i in range(1, 21):
	for v in primes.Factorize(i).GroupBy({x|return x}):
		T[v.Key] = Math.Max(T[v.Key], v.Count())

answer = 1
for i in range(1, 21):
	if (T[i] > 0):
		answer *= Math.Pow(i, T[i])

print answer
assert answer == 232792560