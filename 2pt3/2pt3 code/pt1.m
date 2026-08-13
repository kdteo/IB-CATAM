%Programming Task 1; none of the results shown currently use this program
r = input("r = "); %Input r value

t = linspace(0, 2*pi, 5000); 
z = r*exp(1i*t); %2000 evenly spaced points on C_r
w = f1(z); %

[M, I] = min(abs(w));
disp(['nearest point = ' num2str(w(I)) ', distance = ' num2str(M)])

plot(w,"-")
hold on
plot(w(I), '.', 'MarkerSize', 20)
axis equal
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
grid on
xlabel("Re(z)")
ylabel("Im(z)")
title("f(C_r)")
hold off