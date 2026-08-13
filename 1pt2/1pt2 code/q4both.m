k = 0;

while k <= 15

    %Set initial values x_0, Y_0, step size h, and initialise n
    xn = 0;
    Yn = 0;
    m = 2 .^ k; %the thing that's called n in the question
    h = 0.4 ./ m;
    n = 0; %loop counter

    %Set initial values for analytic value yn, global error En
    yn = 0;
    En = 0;

    while n < m
        %Increment loop counter
        n = n+1;
    
        %Update Yn
        Yn = Yn + h.*f(xn,Yn);

        %Update xn
        xn = xn + h;
    
        %Update yn (analytic solution)
        yn = g(xn);

        %Calculate En
        En = Yn - yn;

    end

    %Set initial values x_0, Y_0, step size h, and initialise n
    xn4 = 0;
    Yn4 = 0;
    n4 = 0;
    
    %Set initial values for analytic value yn, global error En
    yn4 = 0;
    En4 = 0;
    
    %Initialise dummy variables k1,k2,k3,k4 used in RK4
    k1 = 0;
    k2 = 0;
    k3 = 0;
    k4 = 0;
    
    while n4 < m
        %Increment loop counter
        n4 = n4+1;
    
        %Update k1
        k1 = h.*f(xn4,Yn4);
    
        %Update k2
        k2 = h.*f(xn4 + h./2, Yn4 + k1 ./2);
    
        %Update k3
        k3 = h.*f(xn4 + h./2, Yn4 + k2 ./2);
    
        %Update k4
        k4 = h.*f(xn4+h, Yn4 + k3);
        
        %Update Yn
        Yn4 = Yn4 + (k1 + 2.*k2 + 2.*k3 + k4)./6;
    
        %Update xn
        xn4 = xn4 + h;
        
        %Update yn (analytic solution)
        yn4 = g(xn4);
    
        %Calculate En
        En4 = Yn4 - yn4;
    
    end

    %Print out En at xn = 0.4
    disp(['$' num2str(h) '$ & $' num2str(En) '$ & $' num2str(En4) '$ \\'])

    %Increment k
    k = k+1;
end