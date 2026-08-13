%This was used for basically all the results in q2

grain = 25000;
r = linspace(0.9, 1.00, grain);

x = zeros(grain,1);

for i = 1:grain
    x(i) = f1p(pt1funcp(r(i)));
end

plot(r, abs(x), "-")
xlabel("\rho")
ylabel("min(|f_1'(C_\rho)|)")
[M, I] = min(abs(x));
disp([num2str(M) ', ' num2str(x(I)) ', ' num2str(r(I), 6) ', ' num2str(pt1funcp(r(I)), 6)])