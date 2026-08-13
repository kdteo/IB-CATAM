tiledlayout(3,3)

for r = [0.3, 1.5, 3.0]
    nexttile
    t = linspace(0, 2*pi, 5000);
    z = r*exp(1i*t); %5000 points in C_r
    kappa = (1 + real(conj(f1p(z)) .* z .* f1pp(z)) ./ ( abs(f1p(z)).^2) ) ./ abs(f1p(z));
    %Calculate kappa at each of the 5000 points
    plot(t, kappa)
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    ylabel("\kappa")
    title("f_1(C_r), r = " + r)
end

for r = [0.3, 1.5, 3.0]
    nexttile
    t = linspace(0, 2*pi, 5000);
    z = r*exp(1i*t);
    kappa = (1 + real(conj(gp(z)) .* z .* gpp(z)) ./ ( abs(gp(z)).^2) ) ./ abs(gp(z));
    
    plot(t, kappa)
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    ylabel("\kappa")
    title("g(C_r), r = " + r)
end

for r = [0.3, 1.5, 3.0]
    nexttile
    t = linspace(0, 2*pi, 5000);
    z = r*exp(1i*t);
    kappa = (1 + real(conj(hp(z)) .* z .* hpp(z)) ./ ( abs(hp(z)).^2) ) ./ abs(hp(z));
    
    plot(t, kappa)
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    ylabel("\kappa")
    title("h(C_r), r = " + r)
end