/*
The number of rectangles in a NxM rectangle is defined by
sum(1..N) * sum(1..M)

Cache those sums and for each possible rectangle, find the one who has the min
absolute difference to 2*10**6.
*/
import System
import System.Linq.Enumerable

T = array(long, 2000)
T[0] = 0
for i in range(1, 2000):
    T[i] = T[i-1] + i

    
min = 2*10**6
for i in range(2000):
    for j in range(2000):
        if T[i]*T[j] > 2*10**6+min: break
        
        x = Math.Abs(T[i]*T[j]-2*10**6)
        if x < min:
            min = x
            answer = i*j
    

print answer
assert answer == 2772