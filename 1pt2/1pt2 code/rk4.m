%Set initial values x_0, Y_0, step size h, and initialise n
xn = 0;
Yn = 0;
h = 0.2;
n = 0;

%Set initial values for analytic value yn, global error En
yn = 0;
En = 0;

%Initialise variables k1,k2,k3,k4 used in RK4
k1 = 0;
k2 = 0;
k3 = 0;
k4 = 0;

disp([num2str(Yn)])

while xn < 4
    n = n+1; %Increment loop counter

    k1 = h.*f(xn,Yn);     %Update k1
    k2 = h.*f(xn + h./2, Yn + k1 ./2);     %Update k2
    k3 = h.*f(xn + h./2, Yn + k2 ./2);     %Update k3
    k4 = h.*f(xn+h, Yn + k3);     %Update k4

    Yn = Yn + (k1 + 2.*k2 + 2.*k3 + k4)./6;     %Update Yn
    xn = xn + h;     %Update xn
    yn = g(xn);     %Update yn (analytic solution)
    En = Yn - yn;     %Calculate En

    disp([num2str(Yn)])
end