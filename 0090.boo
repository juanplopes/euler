/*
Brute force with bracktrack. Only gotcha is that we replace every 9 with a 6,
to make things easier to compare.

Also reuses check array (the one that is 0..99), using an integer that 
represents the case number, instead of a boolean.
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

V1 = array(int, 6)
V2 = array(int, 6)
T = array(int, 100)

answer = 0
case = 0

def bt2(k as int, v as int) as void:
    if k==6:
        for a in V1:
            for b in V2:
                if a>=0 and b>=0:
                    T[a*10+b]=case+1
                    T[b*10+a]=case+1

        if (01, 04, 06, 16, 25, 36, 46, 64, 81).All({x|T[x]>case}):
            answer+=1
        case+=1
        return

    for i in range(v, 10, 1):
        V2[k]=i
        if i==9: V2[k]=6
        bt2(k+1, i+1)


def bt1(k as int, v as int):
    if k==6:
        bt2(0,0)
        return

    for i in range(v, 10, 1):
        V1[k]=i
        if i==9: V1[k]=6
        bt1(k+1, i+1)


bt1(0,0)
answer /= 2
print answer
assert answer == 1217
