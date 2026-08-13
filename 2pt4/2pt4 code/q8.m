L=10; %Parameter
resulti = zeros(2^6,1); %Initialising empty arrays
resultii = zeros(2^6,1);
thetacoord = zeros(2^6,1);

for k = 1:2^6
    theta = k.* pi ./ (2.^7); %Given values of theta
    thetacoord(k,1) = theta;

    for l = 0:L
        Nli = 5; %N_l under (i)
        Nlii = 2.^ (L-l); %N_l under (ii)

        h = 0.1 .* (2).^(-l);
        t = 100 .* (2).^l; %Th^{-1}

        for i = 1:Nli
            x = 2.*rand() - 1; %Generate X_0
            y = fgd(x,theta,h,t); %Apply gradient descent to get X^{h}_{Th^{-1}}
            z = 0;
            if l ~= 0 %Exclude l=0 case
                z = fgd(x,theta, 2*h, t/2); %Compute X^{h/2}_{2Th^{-1}}
            end
            resulti(k,1) = resulti(k,1) + (y-z) ./ Nli; %Contribution to mean
        end

        for i = 1:Nlii
            x = 2.*rand() - 1; %Generate X_0
            y = fgd(x,theta,h,t); %Apply gradient descent to get X^{h}_{Th^{-1}
            z = 0;
            if l ~= 0 %Exclude l=0 case
                z = fgd(x,theta, 2*h, t/2); %Compute X^{h/2}_{2Th^{-1}}
            end
            resultii(k,1) = resultii(k,1) + (y-z) ./ Nlii; %Contribution to mean
        end
    end
end

hold on
plot(thetacoord,resulti,'r');
plot(thetacoord,resultii, 'b');
theo = mu(thetacoord);
plot(thetacoord,theo,'g');

xlabel('\theta');
legend('(i)', '(ii)', 'm(\theta)', location = 'northeastoutside');
hold off