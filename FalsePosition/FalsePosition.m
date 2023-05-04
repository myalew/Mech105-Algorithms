function [root, fx, ea, iter] = FalsePosition(func, xl, xu, es, maxit, varargin)
%FALSEPOSITION finds the root of a function using false position method

%defining variables
ea = 100; xRoot = xl; iter = 0;

%tests
if nargin < 3
    error ('Must specify function, upper bound, and lower bound.')
end

if nargin < 5
    maxit = 200;
end

if nargin < 4
    es = 0.0001;
end

if func(xu)*func(xl) > 0
    error('No sign change, change xl or xu.')
end

%loop
while ea > es && iter < maxit

    xRootOld = xRoot;
    iter = iter + 1;
   
    xRoot = xu - ((func(xu)*(xl-xu)) / (func(xl)-func(xu)));

    %changing bounds
    test = func(xRoot)*func(xl);

    if test < 0
        xu = xRoot;
    elseif test > 0
        xl = xRoot;
    else
        ea = 0;
    end

    ea = abs((xRoot - xRootOld)/xRoot)*100;
   
end

root = xRoot
fx = func(xRoot)

end
