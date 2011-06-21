import System
import System.Linq.Enumerable

sqr = {x as int|x*x}
all_triplets = [(a,b,cast(int,Math.Sqrt(sqr(a)+sqr(b)))) for a in range(1, 1000) for b in range(a+1,1000)]

valid_triplets = all_triplets.OfType[of (int)]().Where({x as (int)|sqr(x[0])+sqr(x[1]) == sqr(x[2])})

triplets = valid_triplets.Where({x as (int)|sqr(x[0])+sqr(x[1])==sqr(x[2])})

one = triplets.First({x as (int)|x[0]+x[1]+x[2]==1000})

answer = one[0]*one[1]*one[2]

print answer
assert answer == 31875000