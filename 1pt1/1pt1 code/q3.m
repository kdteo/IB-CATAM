n = 11; %Length of binary expansion
p = 3./4;
q = 1-p; %Parameters
l = zeros(1,n+1); %Index (vector of binary digits)
xplot = linspace(0,1, 2.^n+1);
yplot = zeros(1,2.^n + 1);
yplot(2.^n + 1) = 1;

while l(1) < 1
    s = 0; %Loop counter
    %Convert index (vector of binary digits) to decimal integer
    for r = 1:n+1
        s = s + 2.^(n+1-r) .* l(r);
    end

    %Calculate F
    for k = 0:n-1
        %No need to evaluate the product term if x_(k+1) is 0
        if l(k+2) == 0 %Our indexing is one off (we included the coeff of 2^0)
            continue;
        end
        prodtemp = 1; %Temporary variable
        for i = 1:k
            if l(i+1) == 0
                prodtemp = prodtemp * q; %Update product term
            else
                prodtemp = prodtemp * p; %Update product term
            end
        end
        yplot(s+1) = yplot(s+1) + q.*prodtemp;
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
xlabel('x')
ylabel('F(x)')
