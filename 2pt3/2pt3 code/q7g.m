grain = 500; %Number of values of r investigated
r = linspace(0, 3, grain); %Values of r investigated
int = zeros(grain,1);

for count = 1:grain
    t = linspace(0, 2*pi, 5000);
    z = r(count)*exp(1i*t); %5000 points in C_r
    for x = z %Approximating the integral by a finite sum over points in C_r
        int(count) = int(count) + (1 + real(conj(gp(x)) .* x .* gpp(x)) ./ ( abs(gp(x)).^2) ).* (2*pi / 5000);
    end
end

plot(r, int)