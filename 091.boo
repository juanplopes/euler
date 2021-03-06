/*
Brute force. Tried all possible coordinates for ax,ay,bx,by. Verify if it is a
right triangle by calculating the length of the sides and trying the three
posible variable with each side length.
*/
import System
import System.Linq.Enumerable

L = 51
answer = 0
for ax in range(0, L):
    for ay in range(0, L):
        if (ax==0 and ay==0): continue
        for bx in range(0, L):
            for by in range(0, L):
                if bx==0 and by==0 or (ax==bx and ay==by): continue
                A = ax*ax+ay*ay
                B = bx*bx+by*by
                C = (ax-bx)*(ax-bx)+(ay-by)*(ay-by)
                if A==B+C or B==A+C or C==A+B:
                    answer+=1

answer /= 2
print answer
assert answer == 14234