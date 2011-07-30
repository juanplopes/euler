using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using BooRunner.Tools;
using BooEulerTool.Tools;


public class PrimeNumbers : IEnumerable<int>
{
    private bool[] _sieve;
    private IList<int> _cache;

    public PrimeNumbers() : this(1 << 16) { }
    public PrimeNumbers(int until) : this(until, 1 << 16) { }
    public PrimeNumbers(int until, int step) : this(MakeSieve(until, step)) { }

    private static bool[] MakeSieve(int until, int step)
    {
        until++;
        var n = (until - 3) / 2;
        var limit = (int)Math.Sqrt(n);
        var bits = new bool[n];

        for (int b = 0; b < n; b += step)
        {
            var end = Math.Min(n, b + step);
            for (int i = 0; i < limit; i++)
            {
                var k = i * 2 + 3;
                
                var start = (b-i) / k * k + i;
                if (start < b) start += k;
                if (start < i + k) start = i + k;

                if (!bits[i])
                    for (int j = start; j < end; j += k)
                        bits[j] = true;
            }
        }

        return bits;
    }

    public PrimeNumbers(bool[] sieve)
    {
        _sieve = sieve;
        _cache = new List<int>(EnumerateSieve(sieve));
    }

    public IEnumerable<int> Until(int maxPrime)
    {
        return this.TakeWhile(x => x <= maxPrime);
    }

    public int CachedCount { get { return _cache.Count; } }
    public IEnumerable<int> Cache
    {
        get
        {
            foreach (var item in _cache)
                yield return item;
        }
    }

    private static IEnumerable<int> EnumerateSieve(bool[] sieve)
    {
        yield return 2;
        for (int i = 0; i < sieve.Length; i++)
            if (!sieve[i]) yield return i * 2 + 3;
    }

    public IEnumerable<int> Factorize(int number)
    {
        foreach (var n in Factorize((long)number))
            yield return (int)n;
    }

    public IEnumerable<long> Factorize(long number)
    {
        long d, r;
        foreach (int i in this.Until((int)Math.Sqrt(number)))
        {
            if (number == 1) yield break;

            while (true)
            {
                d = Math.DivRem(number, i, out r);
                if (r != 0) break;

                //r == 0
                yield return i;
                number = d;
            }

        }
        if (number != 1)
            yield return number;
    }

    public bool IsPrime(long number)
    {
        if (number < 2) return false;
        if (number == 2) return true;
        if (number % 2 == 0) return false;
        var test = (number - 3) / 2;
        if (test < _sieve.Length)
            return !_sieve[(int)test];
        else
        {
            foreach (int i in this.Until((int)Math.Sqrt(number)))
                if (number % i == 0) return false;

            return true;
        }
    }

    #region IEnumerable<int> Members

    public IEnumerator<int> GetEnumerator()
    {
        foreach (int i in _cache)
            yield return i;

        for (int i = _sieve.Length * 2 + 3; i < int.MaxValue; i++)
            if (IsPrime(i)) yield return i;
    }

    #endregion

    #region IEnumerable Members

    IEnumerator IEnumerable.GetEnumerator()
    {
        return this.GetEnumerator();
    }

    #endregion
}
