import System.Linq.Enumerable from System.Core
print range(1000).Where({x as int|x%5==0 or x%3==0}).Sum()
