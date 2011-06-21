import System
import System.Linq.Enumerable

sqr = {x as int|x*x}
all_triplets = range(0, 1000).SelectMany({a as int|range(a+1,1000).SelectMany({b as int|range(b+1,1000).Select({c as int|(a,b,c)})})})
triplets = all_triplets.Where({x as (int)|sqr(x[0])+sqr(x[1])==sqr(x[2])})
one = triplets.Single({x as (int)|x[0]+x[1]+x[2]==1000})

print one[0]*one[1]*one[2]