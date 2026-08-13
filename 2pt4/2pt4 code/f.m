function y = f(x,theta)
%f_theta as defined in equation (2)

y = (x.^2 - 3./4).^2 - x .* cos(theta);

end