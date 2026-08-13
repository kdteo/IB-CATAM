x = -2; % set initial value x_0
eps = 10^(-5); % set termination error
Nmax = 50; % set max number of iterations
N = 0; % initialise number of iterations to zero
errN = abs(-2.88323687-x); %initialise Nth term error
errNm = abs(-2.88323687-x); %initialise N-1th term error

disp([num2str(N) ' & ' num2str(y) ' & ' num2str(errN) ' & \\'])
while N < Nmax
    N=N+1; % increment N
    y = f(x); % set y = f(x_N-1)
    errNm = errN; % update errNm
    errN = abs(-2.88323687-y); % update errN
    disp([num2str(N) ' & ' num2str(y) ...
        ' & ' num2str(errN) ' & ' num2str(errN/errNm) ' \\'])
    if abs(y-x) < eps % break once required accuracy reached
        break;
    end
    x = y; % set x_N = y
end