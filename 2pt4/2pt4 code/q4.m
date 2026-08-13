theta = pi/4; %Parameters
resultm = zeros(11,1); %Initialising empty arrays
resultn = zeros(11,1);
resulth = zeros(11,1);

for k = 0:10
    h = 0.1 .* (2).^(-k); %h
    Nk = 2 .^ (20-k); %N_k
    Thinv = 100 .* (2).^k; %Th^{-1}
    mean = 0;
    meansq = 0;

    for i = 1:Nk
        x = 2.*rand() - 1; %Randomly generate an initial point x_0
        for j = 1:Thinv %Apply gradient descent to x_0
            x = x - h.*df(x,theta);
        end
        mean = mean + x./Nk; %Update the mean value of X after Th^{-1} iterations
        meansq = meansq + (x.^2)./Nk; %Update the mean value of X^2 after Th^{-1} iterations
    end

    resultm(k+1,1) = mean; %Stores E[X^{h}_{Th^{-1}}]
    resultn(k+1,1) = meansq - mean.^2; %Stores Var[X^{h}_{Th^{-1}}]
    resulth(k+1,1) = h; %Stores values of h

    disp (['$' num2str(k) '$ & $' num2str(h) '$ & $' num2str(resultm(k+1,1)) ...
        '$ & $' num2str(resultn(k+1,1)) '$ \\'])

end

hold on
plot(0:10, resultm, 'b')
plot(0:10, resultn, 'r')

hold off

xlabel('k');
lgd=legend('\mu', '\sigma^2', location='northeastoutside');