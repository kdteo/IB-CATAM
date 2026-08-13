grain = 25000; %Number of values of r investigated
r = linspace(1.55, 1.65, grain); %Values of r investigated 

x = zeros(grain,1);

for i = 1:grain
    x(i) = f1(pt1func(r(i))); %arg min of f_1(z) for z in C_r, for a given r
end

plot(r, abs(x), "-")
xlabel("r")
ylabel("min(|f_1(C_r)|)")
[M, I] = min(abs(x)); %arg min of f_1(z) for z in C_r, over all r in the range
disp([num2str(M) ', ' num2str(x(I)) ', ' num2str(r(I), 6) ', ' num2str(pt1func(r(I)), 6)])