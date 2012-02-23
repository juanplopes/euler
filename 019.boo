/*
Brute force using .Net date handling.
*/
import System
import System.Linq.Enumerable

def dates():
    dt = DateTime(1901, 01, 01)
    while dt.Year <= 2000:
        yield dt
        dt = dt.AddDays(1)

answer = dates().Count({d|d.DayOfWeek == DayOfWeek.Sunday and d.Day == 1})
print answer
assert answer == 171