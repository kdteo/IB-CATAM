k = 0;

while k <= 15

    %Set step size h
    m = vpa(2 .^ k); %the thing that's called n in the question
    h = 0.4 ./ m;

    %Set initial values x_0, Y_0, and initialise n
    xn = vpa(0);
    Yn = vpa(0);
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

    %Print out En at xn = 0.4
    disp([num2str(double(En))])

    %Increment k
    k = k+1;
end

