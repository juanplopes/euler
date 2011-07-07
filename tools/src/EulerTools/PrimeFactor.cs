using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EulerTools
{
    public struct PrimeFactor
    {
        long n, k;
        public long N { get { return n; } }
        public long K { get { return k; } }

        public long Compute()
        {
            return (long)Math.Pow(n, k);
        }

        public PrimeFactor(long n, long k)
            : this()
        {
            this.n = n;
            this.k = k;
        }
    }
}
