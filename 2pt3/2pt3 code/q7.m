tiledlayout(3,1)

grain = 2500;

nexttile

r = linspace(0, 2.5, grain);
int = zeros(grain,1);

for count = 1:grain
    t = linspace(0, 2*pi, 5000);
    z = r(count)*exp(1i*t);
    
    for x = z
        int(count) = int(count) + (1 + real(conj(f1p(x)) .* x .* f1pp(x)) ./ ( abs(f1p(x)).^2) ).* (2*pi / 5000);
    end
    
end

plot(r, int/(2*pi))

grid on
title('\kappa_{tot}/2\pi against r, f_1(C_r)')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlim([0 2.5])
ylim([0 4])

w1 = (1/3 - sqrt((sqrt(34)-5)/18)) - sqrt((sqrt(34)+5)/18)*1i;
rho1 = abs(w1);
w2 = (1/3 + sqrt((sqrt(34)-5)/18)) + sqrt((sqrt(34)+5)/18)*1i;
rho2 = abs(w2);

xline(rho1, '--r', '\rho_1')
xline(rho2, '--r', '\rho_2')

nexttile

int = zeros(grain,1);

for count = 1:grain
    t = linspace(0, 2*pi, 5000);
    z = r(count)*exp(1i*t);
    
    for x = z
        int(count) = int(count) + (1 + real(conj(gp(x)) .* x .* gpp(x)) ./ ( abs(gp(x)).^2) ).* (2*pi / 5000);
    end
    
end

plot(r, int/(2*pi))


grid on
title('\kappa_{tot}/2\pi against r, g(C_r)')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlim([0 2.5])
ylim([0 4])

xline(1/sqrt(3), '--r', '1/\surd3')

nexttile

int = zeros(grain,1);

for count = 1:grain
    t = linspace(0, 2*pi, 25000);
    z = r(count)*exp(1i*t);
    
    for x = z
        int(count) = int(count) + (1 + real(conj(hp(x)) .* x .* hpp(x)) ./ ( abs(hp(x)).^2) ).* (2*pi / 25000);
    end
    
end

plot(r, int/(2*pi))


grid on
title('\kappa_{tot}/2\pi against r, h(C_r)')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlim([0 2.5])
ylim([0 4])

xline(1/3, '--r', '1/3')
xline(1, '--r', '1')
