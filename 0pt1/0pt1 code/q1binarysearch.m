lb = -10000 % lower bound
ub = 10000 % upper bound
N = 0 % iteration number
tError = (ub - lb)/2 % size of possible truncation error
x = (ub+lb)/2 % starting value = midpoint
while tError >= 0.5 * 10^(-5)
    N = N+1 % increment N
    if 2*x - 3*sin(x) + 5 == 0 % break if we landed on the root
        break
    elseif 2*x - 3*sin(x) + 5 > 0 
        ub = x % pick the left half-interval
    elseif 2*x - 3*sin(x) + 5 < 0
        lb = x % pick the right half-interval
    end
    x = (ub+lb)/2 % update midpoint 
    tError = (ub-lb)/2 % update max possible error
end
disp(['x = ' num2str(x) ', N = ' num2str(N) ', tError = ' num2str(tError)])