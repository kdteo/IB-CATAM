grain = 500;

r = linspace(0, 2, grain);
int = zeros(grain,1);

for count = 1:grain
    t = linspace(0, 2*pi, 5000);
    z = r(count)*exp(1i*t);
    
    for x = z
        int(count) = int(count) + (1 + real(conj(f1p(x)) .* x .* f1pp(x)) ./ ( abs(f1p(x)).^2) ).* (2*pi / 5000);
    end
    
end

plot(r, int)