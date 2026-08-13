function [y] = mu(theta)
%Theoretical mu based on theta
x1 = cos((2.*pi + theta )./3);
x2 = cos((2.*pi - theta )./3);
x3 = cos(theta./3);

y = (x2 + 1) .* x1 ./ 2 + (1-x2) .* x3 ./ 2;

end