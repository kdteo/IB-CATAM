%Set initial values t_0, Y_0, step size h, and initialise n
tn = vpa(0);
Yn = vpa(zeros(2,1));
h = vpa(0.4);
n = 0;

%Set initial values for analytic value yn, global error En
yn = vpa(0);
En = 0;

%Initialise dummy variables k1,k2,k3,k4 used in RK4
k1 = zeros(2,1);
k2 = zeros(2,1);
k3 = zeros(2,1);
k4 = zeros(2,1);

disp(['$' num2str(double(tn)) '$ & $' num2str(double(Yn(1))) ...
    '$ & $' num2str(double(En)) '$ \\'])

while n < 25
    n = n+1;     %Increment loop counter

    k1 = h.*f1(tn,Yn);     %Update k1
    k2 = h.*f1(tn + h./2, Yn + k1 ./2);     %Update k2
    k3 = h.*f1(tn + h./2, Yn + k2 ./2);     %Update k3
    k4 = h.*f1(tn+h, Yn + k3);     %Update k4

    Yn = Yn + (k1 + 2.*k2 + 2.*k3 + k4)./6;     %Update Yn
    tn = tn + h;     %Update xn    
    yn = g1(tn);     %Update yn (analytic solution)
    En = Yn(1) - yn;     %Calculate En

    disp(['$' num2str(double(tn)) '$ & $' num2str(double(yn)) ...
        '$ & $' num2str(double(Yn(1))) ...
    '$ & $' num2str(double(En)) '$ \\'])
end