function [y] = fgd(x,theta,h,t)
%Gradient descent for function f_theta with step size h and starting point
%x for t steps

for i = 1:t
            x = x - h.*df(x,theta);
end

y=x;
end