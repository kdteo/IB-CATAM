%question 5

tiledlayout(1,1)

w1 = (1/3 - sqrt((sqrt(34)-5)/18)) - sqrt((sqrt(34)+5)/18)*1i;
w2 = (1/3 + sqrt((sqrt(34)-5)/18)) + sqrt((sqrt(34)+5)/18)*1i;

for r = [1.41385]
    nexttile
    t = linspace(0, 2*pi, 5000);
    z = r*exp(1i*t);
    w = f1(z);

    plot(w,"-")
    axis equal
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    grid on
    %xlabel("Re(z)")
    %ylabel("Im(z)")
    title("f_1(C_r), r = " + r)

    hold on

end