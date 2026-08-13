tiledlayout(1,2)
nexttile;

theta = pi/6;
x = linspace(-1.25,1.25);
y = f(x,pi*theta);
plot(x,y)

title('\theta = \pi/6')
xlabel('x')
ylabel('f(x)')


nexttile;

theta = 3*pi/4;
y = f(x,pi*theta);
plot(x,y)

title('\theta = 3\pi/4')
xlabel('x')
ylabel('f(x)')