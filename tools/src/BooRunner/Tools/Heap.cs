using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Collections;

public class Heap<T>
{
    private List<T> V;
    private Comparison<T> comparer;

    public Heap() : this(null) { }
    public Heap(Comparison<T> comparer)
    {
        this.comparer = comparer ?? Comparer<T>.Default.Compare;
        this.V = new List<T>();
        V.Add(default(T));
    }

    public virtual int Count { get { return V.Count - 1; } }
    public virtual T Front { get { return Count > 0 ? V[1] : default(T); } }

    public virtual void Push(T value)
    {
        V.Add(value);
        BubbleUp(Count);
    }

    public virtual T Pop()
    {
        if (Count == 0) return default(T);
        T value = V[1];

        V[1] = V[Count];
        V.RemoveAt(Count);

        BubbleDown(1);

        return value;
    }

    private void BubbleUp(int n)
    {
        while (n != 1 && IsLess(n, n / 2))
            Swap(n, n = n / 2);
    }

    private void BubbleDown(int n)
    {
        while (IsLess(n * 2, n) || IsLess(n * 2 + 1, n))
            Swap(n, n = Min(n * 2, n * 2 + 1));
    }

    private bool IsLess(int a, int b)
    {
        if (a >= V.Count) return false;
        if (b >= V.Count) return true;
        return comparer(V[a], V[b]) < 0;
    }

    private int Min(int a, int b)
    {
        return IsLess(a, b) ? a : b;
    }

    private void Swap(int a, int b)
    {
        T c = V[a];
        V[a] = V[b];
        V[b] = c;
    }

}


