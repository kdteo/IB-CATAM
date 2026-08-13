%Question 3

tiledlayout(3,1)

for r = [0.8, 1, 1.1] %Different values of r
    nexttile
    t = linspace(0, 2*pi, 5000);
    z = r*exp(1i*t); %5000 points on C_r
    w = g(z); %g(C_r)

    plot(w,"-")
    axis equal
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    grid on
    xlabel("Re(z)")
    ylabel("Im(z)")
    title("g(C_r), r = " + r)

end