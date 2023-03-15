# Lab 6

The objective of this assignment is to implement bucket sort for floating point numbers in both C and MIPS assembly language. We generally use bucket sort when the set of inputs are uniformly distributed over a range.

- **Require**: Input: arr[] is an array of unsorted p floating point numbers, n is the number of buckets where n > 0
- **Require**: Output: bucket[] is an array with sorted p floating point elements.
    1. Create n empty buckets
    2. Do for each array element arr\[i\]:
        - Insert arr\[i\] into bucket\[n*arr\[i\]\]
    3. Sort individual buckets using insertion sort
    4. Concatenate all sorted buckets