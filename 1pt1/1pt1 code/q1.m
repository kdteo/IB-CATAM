N = 10 .^ (6); %Size of random sample
M = 0; %Loop counter

n = 30; %Length of binary expansion

p = 2./3;
q = 1-p; %Parameters

plotpoints = 1000; %Number of points to plot
xplot = linspace(0, 1, plotpoints);
yplot = zeros(1, plotpoints);

while M < N
    m = 1; %Loop counter
    %Generate X_j
    ytemp = 0;
    while m <= n
        flip = rand;
        if flip < p
            ytemp = ytemp + 2 .^ (-m);
        end
        m = m+1;
    end

    i = 0; %Loop counter
    %Increment all points with x>X_j
    while i < plotpoints
        i = i+1;
        if xplot(i) >= ytemp
            yplot(i) = yplot(i) + 1./N;
        end
    end

    M = M+1;
end

plot(xplot,yplot, 'r')
xlabel('x')
ylabel('F(x)')