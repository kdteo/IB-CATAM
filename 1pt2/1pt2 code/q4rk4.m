k = 0;
while k <= 15
    %Set step size h
    m = vpa(2 .^ k); %the thing that's called n in the question
    h = 0.4 ./ m;

    %Set initial values x_0, Y_0, and initialise n
    xn4 = vpa(0);
    Yn4 = vpa(0);
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
        n4 = n4+1; %Increment loop counter
        k1 = h.*f(xn4,Yn4); %Update k1
        k2 = h.*f(xn4 + h./2, Yn4 + k1 ./2); %Update k2
        k3 = h.*f(xn4 + h./2, Yn4 + k2 ./2); %Update k3
        k4 = h.*f(xn4+h, Yn4 + k3); %Update k4

        Yn4 = Yn4 + (k1 + 2.*k2 + 2.*k3 + k4)./6; %Update Yn
        xn4 = xn4 + h; %Update xn
        yn4 = g(xn4); %Update yn (analytic solution)
        En4 = Yn4 - yn4; %Calculate En
    end

    disp([num2str(double(En4))]) %Print out En at xn = 0.4
    k = k+1; %Increment k
end