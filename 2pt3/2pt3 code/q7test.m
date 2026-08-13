r = 1;
grain = 5000;

t = linspace(-pi, pi, grain);
z = r*exp(1i*t);
int = 0;

for x = z
    int = int + (1 + real(conj(hp(x)) .* x .* hpp(x)) ./ ( abs(hp(x)).^2) ).* (2*pi / grain);
end

int = int ./ (2*pi);

disp(num2str(int));