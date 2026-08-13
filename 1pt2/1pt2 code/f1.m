function [ z ] = f1(t,y)
%f1 is the function given by equations (11) and (12)

%Set parameters
l = vpa(1);
w = vpa(sqrt(3));

z = zeros(2,1);

z(1) = y(2);
z(2) = -l .* y(2) - y(1) + sin(w .* t);

end