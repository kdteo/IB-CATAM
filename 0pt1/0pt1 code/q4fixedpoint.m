x = 4.5; % set initial value x_0
eps = 10^(-5); % set termination error
Nmax = 1000; % set max number of iterations
N = 0; % initialise number of iterations to zero

errN = abs(4-x); %initialise Nth term error
errNm = abs(4-x); %initialise N-1th term error

while N < Nmax
    N=N+1; % increment N
    y = f(x); % set y = f(x_N-1)
    errNm = errN; % update errNm
    errN = abs(4-y); % update errN
    if abs(y-x) < eps % break once required accuracy reached
        break;
    end
    x = y; % set x_N = y
end

disp(['N = ' num2str(N) ', x_N = ' num2str(y) ...
        ', ' num2str(errN) ' & ' num2str(errN/errNm)])