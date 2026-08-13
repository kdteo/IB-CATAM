d = 20;

%Set initial values t_0, Y_0, step size h, number of steps m, and initialise n
tn = vpa(0);
Yn = vpa(zeros(2,1));
h = vpa(0.01);
m = int16(60 ./ h); %Number of steps for termination
n = 0; %Iteration counter

disp(['h = ' num2str(double(h))]);

s = int16(m./30);
k = s;

%Initialise dummy variables k1,k2,k3,k4 used in RK4
k1 = zeros(2,1);
k2 = zeros(2,1);
k3 = zeros(2,1);
k4 = zeros(2,1);

y=0;

while n < m
    %Increment loop counter
    n = n+1;

    %Update k1
    k1 = h.*f3(d,tn,Yn);

    %Update k2
    k2 = h.*f3(d,tn + h./2, Yn + k1 ./2);

    %Update k3
    k3 = h.*f3(d,tn + h./2, Yn + k2 ./2);

    %Update k4
    k4 = h.*f3(d,tn+h, Yn + k3);
    
    %Update Yn
    Yn = Yn + (k1 + 2.*k2 + 2.*k3 + k4)./6;

    %Update xn
    tn = tn + h;
    
    y=Yn(1);%For debugging

    if n == k
        disp(['tn = ' num2str(double(tn)) ...
            ' Y = ' num2str(double(Yn(1)),3)])
        k=k+s;
    end

end