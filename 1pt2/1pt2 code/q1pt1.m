%Set initial values x_0, Y_0, step size h, and initialise n
xn = 0;
Yn = 0;
h = 0.6;
n = 0;

%Set initial values for analytic value yn, global error En, Gn, Gn-1
yn = 0;
En = 0;
Gn = 0; %G_(n-1)
Gnm = 0; %G_n

disp(['$' num2str(n) '$ & $' num2str(xn) '$ & $' num2str(Yn) ...
    '$ & $' num2str(yn) '$ & $' num2str(En) '$ & $' ...
    num2str(Gn) '$ & $' num2str(Gn-Gnm) '$ \\'])

while n < 15
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

    %Set Gnm
    Gnm = Gn;

    %Calculate Gn
    Gn = log(abs(En)) ./ h;

    disp(['$' num2str(n) '$ & $' num2str(xn) '$ & $' num2str(Yn) ...
    '$ & $' num2str(yn) '$ & $' num2str(En) '$ & $' ...
    num2str(Gn) '$ & $' num2str(Gn-Gnm) '$ \\'])
end