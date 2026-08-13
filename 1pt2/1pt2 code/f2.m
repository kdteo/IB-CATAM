function [ z ] = f2(w,l,t,y)
%f2 is the function given by equations (11) and (12)

z = zeros(2,1);

z(1) = y(2);
z(2) = -l .* y(2) - y(1) + sin(w .* t);

end