x = 4.25; % set initial value x_0
eps = 0; % set termination error
Nmax = 10; % set max number of iterations
N = 0; % initialise number of iterations to zero
errN = abs(4-x); %initialise Nth term error
errNm = abs(4-x); %initialise N-1th term error

disp([num2str(N) ' & ' num2str(x) ' & ' num2str(errN) ' & \\'])
while N < Nmax
    N=N+1; % increment N
    y = h(x); % set y = f(x_N-1)
    errNm=errN; % update errNm
    errN = abs(4-y); % update errN
    disp([num2str(N) ' & ' num2str(y,6) ' & ' num2str(errN, 8) ...
        ' & ' num2str(errN/(errNm)) ' \\']) %print results in LaTeX table
    if abs(y-x) < eps % break once required accuracy reached
        break;
    end
    x = y; % set x_N = y
end