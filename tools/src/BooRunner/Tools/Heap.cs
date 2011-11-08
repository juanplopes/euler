﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Collections;
//====================================================
//| Downloaded From                                  |
//| Visual C# Kicks - http://www.vcskicks.com/       |
//| License - http://www.vcskicks.com/license.html   |
//====================================================

/// <summary>
/// Priority Queue data structure
/// </summary>
public class Heap<T>
{
    protected List<T> storedValues;
    protected Comparison<T> comparison;

    public Heap() : this(null) { }
    public Heap(Comparison<T> comparison)
    {
        if (comparison == null)
        {
            if (typeof(IComparable).IsAssignableFrom(typeof(T)))
                comparison = (a, b) => Comparer.Default.Compare(a, b);

            if (typeof(IComparable<T>).IsAssignableFrom(typeof(T)))
                comparison = Comparer<T>.Default.Compare;

            throw new InvalidCastException("created heap without comparator, nor comparable type... how should I compare?");
        }
        this.comparison = comparison;

        //Initialize the array that will hold the values
        storedValues = new List<T>();

        //Fill the first cell in the array with an empty value
        storedValues.Add(default(T));
    }

    /// <summary>
    /// Gets the number of values stored within the Priority Queue
    /// </summary>
    public virtual int Count
    {
        get { return storedValues.Count - 1; }
    }

    /// <summary>
    /// Returns the value at the head of the Priority Queue without removing it.
    /// </summary>
    public virtual T Front()
    {
        if (this.Count == 0)
            return default(T); //Priority Queue empty
        else
            return storedValues[1]; //head of the queue
    }

    /// <summary>
    /// Adds a value to the Priority Queue
    /// </summary>
    public virtual void Push(T value)
    {
        //Add the value to the internal array
        storedValues.Add(value);

        //Bubble up to preserve the heap property,
        //starting at the inserted value
        this.BubbleUp(storedValues.Count - 1);
    }

    /// <summary>
    /// Returns the minimum value inside the Priority Queue
    /// </summary>
    public virtual T Pop()
    {
        if (this.Count == 0)
            return default(T); //queue is empty
        else
        {
            //The smallest value in the Priority Queue is the first item in the array
            T minValue = this.storedValues[1];

            //If there's more than one item, replace the first item in the array with the last one
            if (this.storedValues.Count > 2)
            {
                T lastValue = this.storedValues[storedValues.Count - 1];

                //Move last node to the head
                this.storedValues.RemoveAt(storedValues.Count - 1);
                this.storedValues[1] = lastValue;

                //Bubble down
                this.BubbleDown(1);
            }
            else
            {
                //Remove the only value stored in the queue
                storedValues.RemoveAt(1);
            }

            return minValue;
        }
    }

    /// <summary>
    /// Restores the heap-order property between child and parent values going up towards the head
    /// </summary>
    protected virtual void BubbleUp(int startCell)
    {
        int cell = startCell;

        //Bubble up as long as the parent is greater
        while (this.IsParentBigger(cell))
        {
            //Get values of parent and child
            T parentValue = this.storedValues[cell / 2];
            T childValue = this.storedValues[cell];

            //Swap the values
            this.storedValues[cell / 2] = childValue;
            this.storedValues[cell] = parentValue;

            cell /= 2; //go up parents
        }
    }

    /// <summary>
    /// Restores the heap-order property between child and parent values going down towards the bottom
    /// </summary>
    protected virtual void BubbleDown(int startCell)
    {
        int cell = startCell;

        //Bubble down as long as either child is smaller
        while (this.IsLeftChildSmaller(cell) || this.IsRightChildSmaller(cell))
        {
            int child = this.CompareChild(cell);

            if (child == -1) //Left Child
            {
                //Swap values
                T parentValue = storedValues[cell];
                T leftChildValue = storedValues[2 * cell];

                storedValues[cell] = leftChildValue;
                storedValues[2 * cell] = parentValue;

                cell = 2 * cell; //move down to left child
            }
            else if (child == 1) //Right Child
            {
                //Swap values
                T parentValue = storedValues[cell];
                T rightChildValue = storedValues[2 * cell + 1];

                storedValues[cell] = rightChildValue;
                storedValues[2 * cell + 1] = parentValue;

                cell = 2 * cell + 1; //move down to right child
            }
        }
    }

    /// <summary>
    /// Returns if the value of a parent is greater than its child
    /// </summary>
    protected virtual bool IsParentBigger(int childCell)
    {
        if (childCell == 1)
            return false; //top of heap, no parent
        else
            return comparison(storedValues[childCell / 2], storedValues[childCell]) > 0;
        //return storedNodes[childCell / 2].Key > storedNodes[childCell].Key;
    }

    /// <summary>
    /// Returns whether the left child cell is smaller than the parent cell.
    /// Returns false if a left child does not exist.
    /// </summary>
    protected virtual bool IsLeftChildSmaller(int parentCell)
    {
        if (2 * parentCell >= storedValues.Count)
            return false; //out of bounds
        else
            return comparison(storedValues[2 * parentCell], storedValues[parentCell]) < 0;
        //return storedNodes[2 * parentCell].Key < storedNodes[parentCell].Key;
    }

    /// <summary>
    /// Returns whether the right child cell is smaller than the parent cell.
    /// Returns false if a right child does not exist.
    /// </summary>
    protected virtual bool IsRightChildSmaller(int parentCell)
    {
        if (2 * parentCell + 1 >= storedValues.Count)
            return false; //out of bounds
        else
            return comparison(storedValues[2 * parentCell + 1], storedValues[parentCell]) < 0;
        //return storedNodes[2 * parentCell + 1].Key < storedNodes[parentCell].Key;
    }

    /// <summary>
    /// Compares the children cells of a parent cell. -1 indicates the left child is the smaller of the two,
    /// 1 indicates the right child is the smaller of the two, 0 inidicates that neither child is smaller than the parent.
    /// </summary>
    protected virtual int CompareChild(int parentCell)
    {
        bool leftChildSmaller = this.IsLeftChildSmaller(parentCell);
        bool rightChildSmaller = this.IsRightChildSmaller(parentCell);

        if (leftChildSmaller || rightChildSmaller)
        {
            if (leftChildSmaller && rightChildSmaller)
            {
                //Figure out which of the two is smaller
                int leftChild = 2 * parentCell;
                int rightChild = 2 * parentCell + 1;

                T leftValue = this.storedValues[leftChild];
                T rightValue = this.storedValues[rightChild];

                //Compare the values of the children
                if (comparison(leftValue, rightValue) <= 0)
                    return -1; //left child is smaller
                else
                    return 1; //right child is smaller
            }
            else if (leftChildSmaller)
                return -1; //left child is smaller
            else
                return 1; //right child smaller
        }
        else
            return 0; //both children are bigger or don't exist
    }

}


