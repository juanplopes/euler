/*
Simple Markov Chain

Given M[i,j], the probability of starting at "i" and end at "j", computes the
result of M^1024.
*/
import System
import System.Collections.Generic
import System.Linq.Enumerable

M = matrix(double, 40, 40)

def add(i as int, j as int, v as double):
    M[i,j] = M[i,j] + v

dice = 4
for i in range(40):
    for a in range(1,dice+1):
        for b in range(1,dice+1):
            d = (i+a+b)%40
            p = 1.0/(dice*dice)
            if a==b:
                add(i,10,p /(dice*dice))
                p -= p /(dice*dice)
            
            if d in (2,17,33):
                add(i,0, p/16)
                add(i,10, p/16)
                add(i,d, p*14/16)
                continue
            
            if d in (7, 22, 36):
                add(i,0, p/16)
                add(i,10, p/16)
                add(i,11, p/16)
                add(i,24, p/16)
                add(i,39, p/16)
                add(i,5, p/16)
                add(i,((d+5) * 10 / 10 + 5)%40, p*2/16)

                if d<12 or d>28:
                    add(i,12,p/16)
                elif d<28:
                    add(i,28,p/16)
                add(i,(d+37)%40, p/16)
                add(i,d, p*6/16)
                continue
            
            if d==30: d = 10

            add(i,d, p)

T = M
for steps in range(10):
    T2 = matrix(double, 40, 40)
    for i in range(40):
        for k in range(40):
            for j in range(40):
                T2[i,j] = T2[i,j] + T[i,k]*T[k,j]
    T = T2

L = List[of (double)]()
for i in range(40):
    s = 0.0
    for j in range(40):
        s += T[j,i]
    L.Add((s,i))

answer = int.Parse(String.Join("", L.OrderByDescending({x|x[0]}).Select({x|x[1].ToString("00")}).Take(3).ToArray()))
print answer
assert answer == 101524
