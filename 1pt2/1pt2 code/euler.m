%Set initial values x_0, Y_0, step size h, and initialise n
xn = 0;
Yn = 0;
h = 0.2;
n = 0;

%Set initial values for analytic value yn, global error En
yn = 0;
En = 0;

disp([num2str(Yn)])

while xn < 0.4
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

    disp([num2str(Yn)])
end