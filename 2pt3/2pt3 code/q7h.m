grain = 500;

r = linspace(0, 3, grain);
int = zeros(grain,1);

for count = 1:grain
    t = linspace(0, 2*pi, 25000);
    z = r(count)*exp(1i*t);
    
    for x = z
        int(count) = int(count) + (1 + real(conj(hp(x)) .* x .* hpp(x)) ./ ( abs(hp(x)).^2) ).* (2*pi / 25000);
    end
    
end

plot(r, int)