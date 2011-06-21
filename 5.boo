import System.Linq.Enumerable

print range(1, int.MaxValue).Where({x as int|range(1, 21).All({y as int|x%y==0})}).First()