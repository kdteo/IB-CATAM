r = input('r = ');

t = linspace(0, 2*pi, 5000);
z = r*exp(1i*t);
int = 0;

for x = z
    int = int + (1 + real(conj(f1p(x)) .* x .* f1pp(x)) ./ ( abs(f1p(x)).^2) ).* (2*pi / 5000);
end

int = int ./ (2*pi);

disp(num2str(int));