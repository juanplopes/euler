using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using BooRunner.Tools;
using BooEulerTool.Tools;


public class PrimeNumbers : IEnumerable<int>
{
    private BitArray _sieve;
    private IList<int> _cache;

    public PrimeNumbers() : this(Resources.Primes) { }

    public PrimeNumbers(byte[] sieve) : this(new BitArray(sieve)) { }

    public PrimeNumbers(int until) : this(new PrimeNumbers(), until) { }
    public PrimeNumbers(PrimeNumbers primes, int until) : this(MakeSieve(primes, until)) { }

    private static BitArray MakeSieve(PrimeNumbers primes, int until)
    {
        until++;
        var bits = new BitArray(until);
        bits[0] = true;
        bits[1] = true;

        foreach (var prime in primes.Until((int)Math.Sqrt(until)))
            for (int i = prime * 2; i < until; i += prime)
                bits[i] = true;

        return bits.Not();
    }

    public PrimeNumbers(BitArray sieve)
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

    public PrimeNumbers Expand(int until)
    {
        return new PrimeNumbers(this, until);
    }

    private static IEnumerable<int> EnumerateSieve(BitArray sieve)
    {
        for (int i = 0; i < sieve.Length; i++)
            if (sieve[i]) yield return i;
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
        if (number < 0) return false;

        if (number < _sieve.Length)
            return _sieve[(int)number];
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

        for (int i = _sieve.Length; i < int.MaxValue; i++)
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
