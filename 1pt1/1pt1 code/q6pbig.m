tiledlayout(2,1)

%Length of binary expansion
n = 9;
m = 3; %Maximum value of delta is 2^-m

for M = [2 3]
    nexttile;

    %Parameters
    p = 2./3;
    q = 1-p;
    
    c = zeros(1,n+1);
    c(M) = 1; 

    Fc = 0;
    %Value of F(c)
    for k = 0:n-1
        %No need to evaluate the product term if x_(k+1) is 0
        if c(k+2) == 0 %Our indexing is one off because we included the coeff of 2^0
            continue;
        end
        prodtemp = 1;
        for i = 1:k
            if c(i+1) == 0
                prodtemp = prodtemp * q; % Update product term with probability p
            else
                prodtemp = prodtemp * p; % Update product term with probability q
            end
        end
        Fc = Fc + q.*prodtemp;
    end


    l = zeros(1,n+1); %Index (vector of binary digits)
    
    xplot = zeros(1,2.^(n-m)+1);
    yplot = zeros(1,2.^(n-m) + 1);
    xplot(1) = 0;  
    yplot(1) = 0;
    nxplot = zeros(1,2.^(n-m)+1);
    nyplot = zeros(1,2.^(n-m) + 1);
    nxplot(1) = 0;
    nyplot(1) = 0;
    
    while l(m+1) < 1
    
        %Increment index by one
        for j = 0:n
            l(n+1-j) = mod(l(n+1-j)+1,2);
            if l(n+1-j) == 1
                break;
            end
        end
    
        s = 0;
        %Convert index to integer
        for r = 1:n+1
            s = s + 2.^(n+1-r) .* l(r);
        end
    
        %Find corresponding value of delta
        d = s ./ (2.^n);
        xplot(s+1) = d;
        nxplot(s+1) = -d;
    
        %Binary addition of c and delta
        x = c+l;
        for t = 0:n
            if x(n+1-t) == 2
                x(n+1-t) = 0;
                x(n-t) = x(n-t)+1;
            end
            if x(n+1-t) == 3
                x(n+1-t) = 1;
                x(n-t) = x(n-t)+1;
            end
        end
        
        %Evaluate F(x)
        for k = 0:n-1
            %No need to evaluate the product term if x_(k+1) is 0
            if x(k+2) == 0 %Our indexing is one off because we included the coeff of 2^0
                continue;
            end
            prodtemp = 1;
            for i = 1:k
                if x(i+1) == 0
                    prodtemp = prodtemp * q; % Update product term with probability p
                else
                    prodtemp = prodtemp * p; % Update product term with probability q
                end
            end
            yplot(s+1) = yplot(s+1) + q.*prodtemp;
        end
        
        %(F(x)-F(c)) / d
        yplot(s+1) = yplot(s+1) - Fc;
        yplot(s+1) = yplot(s+1) ./ d;
    
        %Binary subtraction of c and delta
        x = c-l;
    
        for t = 0:n
            if x(n+1-t) == -1
                x(n+1-t) = 1;
                x(n-t) = x(n-t)-1;
            end
            if x(n+1-t) == -2
                x(n+1-t) = 0;
                x(n-t) = x(n-t) - 1;
            end
        end
    
        %Evaluate F(x)
        for k = 0:n-1
            %No need to evaluate the product term if x_(k+1) is 0
            if x(k+2) == 0 %Our indexing is one off because we included the coeff of 2^0
                continue;
            end
            prodtemp = 1;
            for i = 1:k
                if x(i+1) == 0
                    prodtemp = prodtemp * q; % Update product term with probability p
                else
                    prodtemp = prodtemp * p; % Update product term with probability q
                end
            end
            nyplot(s+1) = nyplot(s+1) + q.*prodtemp;
        end
    
        %(F(x)-F(c)) / d
        nyplot(s+1) = nyplot(s+1) - Fc;
        nyplot(s+1) = -nyplot(s+1) ./ d;
    end
    
    hold on;
    plot(xplot,yplot, 'b')
    plot(nxplot,nyplot,'b')
    xlabel('\delta')
    ylabel('(F(x+\delta) - F(c))/\delta')

    title(['c = 1/' num2str(2.^(M-1))]);
    
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    hold off;

end