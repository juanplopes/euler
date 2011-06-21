import System.Linq.Enumerable

is_palindrome = {x as int|x.ToString().Reverse().SequenceEqual(x.ToString())}
multiply_by = {x as int| range(100, 1000).Select({y as int|x*y})}
numbers = range(100, 1000).SelectMany(multiply_by)

print numbers.Where(is_palindrome).Max()
