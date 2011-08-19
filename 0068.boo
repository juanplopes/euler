/*
Extremely bruteforce. Defines the 5-gon as
        F
            A
        B       C
     G    D   E  
           
And so on. Generate values only until F. The others can be calculated. Apply
constraints. Only F..J can reach 10, otherwise it'll create an 17-digit string.

I know, it's ugly, but works and runs fast :)
*/
import System
import System.Linq.Enumerable

def make_number(triples as ((int))):
    min = triples.Select({x|x[0]}).Min()
    for i in range(5):
        if triples[i][0] == min:
            start = i

            
    triples = triples.Skip(start).Concat(triples.Take(start)).ToArray()
    numbers = triples.Select({x|string.Join('',x.Select({x|Convert.ToString(x)}).ToArray())})
    number = long.Parse(string.Join('', numbers.ToArray()))
    return number

answer = 0L
for a in range(1,10):
    for b in range(1,10):
        if b in (a,): continue
        for c in range(1,10):
            if c in (a,b): continue
            for d in range(1,10):
                if d in (a,b,c): continue
                for e in range(1,10):
                    if e in (a,b,c,d): continue
                    for f in range(1,11):
                        if f in (a,b,c,d,e): continue
                        z = f+a+c
                        g = z-b-a
                        if g < 0 or g > 10 or g in (a,b,c,d,e,f): continue
                        
                        h = z-d-b
                        if h < 0 or h > 10 or h in (a,b,c,d,e,f,g): continue
                        
                        i = z-e-d
                        if i < 0 or i > 10 or i in (a,b,c,d,e,f,g,h): continue
                        
                        j = z-c-e
                        if j < 0 or j > 10 or j in (a,b,c,d,e,f,g,h, i): continue
                        
                        triples = ((j,c,e),(i,e,d),(h,d,b),(g,b,a),(f,a,c))
                        answer = Math.Max(answer, make_number(triples))
                        
print answer
assert answer == 6531031914842725
