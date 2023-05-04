Algorithm finds the root of a function using the false position method. Takes a function, lower bound, and upper bound. Can also optionally 
accept stopping criterion error, and max iteration count. Returns the root, y-value of function (should be around zero), relative approximate 
error, and number of iterations.

Syntax: FalsePosition(func, xl, xu, es, maxit, varargin)

Example:
>> func = @(x) x^2-1
>> FalsePosition(func, -3, 0, 0.001, 100)
