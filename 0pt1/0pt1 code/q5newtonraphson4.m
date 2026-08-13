x = -2.5; % set initial value x_0
eps = 0; % set termination error
Nmax = 10; % set max number of iterations
N = 0; % initialise number of iterations to zero
errN = abs(-2.8832368725582835367-vpa(x,100)); %initialise Nth term error
errNm = abs(-2.8832368725582835367-vpa(x,100)); %initialise N-1th term error

disp([num2str(N) ' & ' num2str(x) ' & ' num2str(double(errN)) ' & \\'])
while N < Nmax
    N=N+1; % increment N
    y = g(vpa(x,100)); % set y = f(x_N-1)
    errNm=errN;
    errN = abs(-2.8832368725582835367-vpa(y,100)); % update errN
    disp([num2str(N) ' & ' num2str(double(y), 20) ' & ' ...
        num2str(double(errN)) ...
        ' & ' num2str(double(errN/(errNm^2))) ' \\'])
    if abs(y-x) < eps % break once required accuracy reached
        break;
    end
    x = vpa(y); % set x_N = y
end