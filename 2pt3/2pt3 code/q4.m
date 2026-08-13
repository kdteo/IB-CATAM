%question 4

tiledlayout(2,1)

for r = [1.8, sqrt(5)]
    nexttile
    t = linspace(0, 2*pi, 5000);
    z = r*exp(1i*t);
    w = h(z);

    plot(w,"-")
    axis equal
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    grid on
    xlabel("Re(z)")
    ylabel("Im(z)")
    title("h(C_r), r = " + r)
    hold on

end

plot(16,0, 'o', 'MarkerSize', 5)