/*
Creates infinite fibonacci lazy list, using generator. 
Then filters it using LINQ
*/
import System.Linq.Enumerable

def fibs():
    a,b=(0,1)
    while(true):
        a,b=(a+b,a) 
        yield a

answer = fibs().Where({x|x%2==0}).TakeWhile({x|x<=4*10**6}).Sum()

print answer
assert answer == 4613732