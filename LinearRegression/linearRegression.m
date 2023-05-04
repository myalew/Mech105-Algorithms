function [fX, fY, slope, intercept, Rsquared] = linearRegression(x, y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

if length(x) ~= length(y)
    error('x and y must be the same length')
end

%Sorting 

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

%IQR

med = median(sortedY);

Q1 = median(sortedY(sortedY<med));
Q3 = median(sortedY(sortedY>med));
IQR = Q3-Q1;

%Outliers

outliers = sortedY < (Q1 - 1.5*IQR) | sortedY > (Q3 + 1.5*IQR);

fY = sortedY(~outliers);
fX = sortedX(~outliers);

%Linear Regression

nActual = length(fY);
yBar = sum(fY)/length(fY);
xBar = sum(fX)/length(fX);

slope = (nActual*sum(fX.*fY)-sum(fX).*sum(fY))/(nActual*sum(fX.^2)-(sum(fX)^2));
intercept = yBar - slope*xBar;

%R-squared

sR = sum((fY-intercept-slope*fX).^2);
sT = sum((fY-yBar).^2);

Rsquared = 1-(sR/sT);

end

