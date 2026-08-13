function [ y ] = g( x )
% f is the function used for fixed-point iteration

% set any parameters (in this case, k)

% set function here
y = (-3*vpa(x,100)*cos(vpa(x,100)) + 3 * sin(vpa(x,100)) - 5)/(2 - 3*cos(vpa(x,100)));

end