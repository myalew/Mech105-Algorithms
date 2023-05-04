function [I] = simpsonsRule(x,y)
%SIMPSONSRULE, Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

if length(x) ~= length(y)
    error('x and y must be the same length')
end

space = x(2)-x(1);

for i = 1:length(x)-1
    if x(i+1)-x(i) ~=  space
        error('not equally spaced')
    end
end

if length(x) == 2
    
    c = x(end-1);
    d = x(end);
    I = (d-c)*(y(end-1)+y(end))/2;
    warning('trap rule will be used on last interval')

elseif length(x) == 3
    
    n = length(x)-1;
    a = x(1);
    b = x(end);

    I = (b-a)*(y(1)+4*y(2)+y(end))/(3*n);
    
    
else

    finalSegment = 0;

    if rem((length(x)-1), 2) ~= 0
        c = x(end-1);
        d = x(end);
        finalSegment = (d-c)*(y(end-1)+y(end))/2;
        x(length(x)) = [];
        y(length(x)) = [];
        warning('trap rule will be used on last interval')
    end
    
    n = length(x)-1;
    a = x(1);
    b = x(end);
    odd = [];
    even = [];
    
    %odd n
    for i = 1:length(x)
        if rem(i, 2) == 0
            odd(end+1) = y(i);
        end
    end
    
    % even n 
    for i = 2:length(x)
        if rem(i, 2) ~= 0
            even(end+1) = y(i);
        end
    end
    
    I = (b-a)*(y(1)+4*sum(odd)+2*sum(even)+y(end))/(3*n)+finalSegment;

end

end

