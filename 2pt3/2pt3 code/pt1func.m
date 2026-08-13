function [x] = pt1func(r)
%This finds argmin |f(z)| for z in C_r, as a function of r

t = linspace(0, 2*pi, 25000);
z = r*exp(1i*t);
w = f1(z);

[M, I] = min(abs(w));
x = z(I);

end