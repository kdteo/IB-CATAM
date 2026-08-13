% I DID NOT END UP USING THIS (but its a cute idea)

rho = 0.001;
root = -0.00048578+0.61821i;

grain = 10000;
t = linspace(0, 2*pi, grain);
z = root + rho.*exp(1i.*t);

int = 0;

for x = z
    int = int + (f1p(x) .* (x - root)) ./ (f1(x) .* grain);
end

disp(num2str(int))