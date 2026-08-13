function [ y ] = g2(w,l,t)
%g1 is the analytic solution given by equation (IV)

mu = sqrt(4-l.^2);
C = 1 ./ ((1-w.^2).^2 + (w.^2) .* (l.^2));

yc = C .* exp(-l.*t./2) .* ( ...
    ( (w.*l^2 - 2.*w.*(1-w.^2)) .*...
    sin(mu.*t./2))./mu + w.*l.*cos(mu.*t./2));

yp = C .* ((1-w.^2).*sin(w.*t) - w.*l.*cos(w.*t));

y = yc + yp;

end 