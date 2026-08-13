%Size of random sample
N = 10 .^ (6);
M = 0; %Loop counter

%Length of binary expansion
n = 30;

%Parameters
p = 2./3;
q = 1-p;


plotpoints = 1000;
xplot = linspace(0, 1, plotpoints);
yplot = zeros(1, plotpoints);

while M < N

    m = 1; %Loop counter

    ytemp = 0;
    while m <= n
        flip = rand;
        if flip < p
            ytemp = ytemp + 2 .^ (-m);
        end
        m = m+1;
    end

    i = 0;
    while i < plotpoints
        i = i+1;
        if xplot(i) >= ytemp
            yplot(i) = yplot(i) +1;
            %break;
        end
    end

    M = M+1;
end

%j = 0;
%while j < plotpoints-1
    %j = j+1;
    %yplot(j+1) = yplot(j+1) + yplot(j);
%end


yplot = yplot ./ N;

plot(xplot,yplot, 'r')
xlabel('x')
ylabel('F(x)')

hold on

%Length of binary expansion
n = 11;

%Parameters
p = 3./4;
q = 1-p;

l = zeros(1,n+1); %Index (vector of binary digits)
xplot = linspace(0,1, 2.^n+1);
yplot = zeros(1,2.^n + 1);
yplot(2.^n + 1) = 1;

while l(1) < 1
    m = 0;
    %Convert index to number
    for r = 1:n+1
        m = m + 2.^(n+1-r) .* l(r);
    end

    for k = 0:n-1
        %No need to evaluate the product term if x_(k+1) i
        if l(k+2) == 0 %Our indexing is one off because we included the coeff of 2^0
            continue;
        end
        prodtemp = 1;
        for i = 1:k
            if l(i+1) == 0
                prodtemp = prodtemp * q; % Update product term with probability p
            else
                prodtemp = prodtemp * p; % Update product term with probability q
            end
        end
        yplot(m+1) = yplot(m+1) + q.*prodtemp;
    end
    %Increment index by one
    for j = 0:n
        l(n+1-j) = mod(l(n+1-j)+1,2);
        if l(n+1-j) == 1
            break;
        end
    end
end

plot(xplot,yplot, 'b')

legend('p=2/3', 'p=3/4')

