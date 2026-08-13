function [ z ] = f3(d,t,y)
%f3 is the function given by equation (VI)

z = zeros(2,1);

z(1) = y(2);
z(2) = -d.^3 .* (y(1)).^2 .* y(2) - y(1) + sin(t);

end