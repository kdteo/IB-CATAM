L=10; %Greatest value of l for which N_l > 1
result = zeros(2^6,1); %Initialise empty arrays
resultsq = zeros(2^6,1);
thetacoord = zeros(2^6,1);

Nl = zeros(L+1,1);
Nl = [32768 11585 4096 1448 512 181 64 22 8 2 1]; %Values for optimal N_l
%Proportional to 2^{-3l/2}

for k = 1:2^6
    theta = k.* pi ./ (2.^7);
    thetacoord(k,1) = theta;

    for l = 0:L %MLMC scheme from before
        h = 0.1 .* (2).^(-l);
        t = 100 .* (2).^l;
        for i = 1:Nl(l+1) 
            x = 2.*rand() - 1;
            y = fgd(x,theta,h,t);
            z = 0;
            if l ~= 0
                z = fgd(x,theta, 2*h, t/2);
            end
            result(k,1) = result(k,1) + (y-z) ./ Nl(l+1);
        end
    end
end

x1 = cos((2*pi + thetacoord)./3);
x2 = cos((2*pi - thetacoord)./3);
x3 = cos(thetacoord ./ 3);

p1 = (x3 - result) ./ (x3 - x1); %Computed value of p_1 from mu
p2 = (result - x1) ./ (x3 - x1); %Computed value of p_2 from mu

tiledlayout (2,2)

nexttile;
hold on
theo = mu(thetacoord);
plot(thetacoord,theo,'g');
plot(thetacoord,result,'r');
xlabel('\theta');
ylabel('\mu');
title('\mu against \theta');
hold off

nexttile;
hold on
plot(thetacoord, (x2+1) .* (1-x2) .* (x1 - x3).^2 ./ 4, 'g')
plot(thetacoord, p1 .* x1.^2 + p2 .* x3.^2 - result .^ 2, 'r');
xlabel('\theta');
ylabel('\sigma^2');
title('\sigma^2 against \theta');
hold off

nexttile;
hold on
plot(thetacoord, (x2+1)./2, 'g')
plot(thetacoord, p1, 'r');
xlabel('\theta');
ylabel('p_1(\theta)');
title('p_1(\theta) against \theta');
hold off

nexttile;
hold on
plot(thetacoord, (1-x2)./2, 'g')
plot(thetacoord,p2, 'r');
xlabel('\theta');
ylabel('p_2(\theta)');
title('p_2(\theta) against \theta');
hold off