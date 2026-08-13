%Defining parameters, locations of minima
theta = pi/6; 
h = 0.01;
N = 1000;
x1 = cos(13*pi/18);
x3 = cos(pi/18);

for x_0 = -1:1/50:1 %Evenly spaced points initial points x_0
    x = x_0;
    
    for i = 1:N %Apply gradient descent starting from the initial points
        x = x - h.*df(x,theta);
    end
    
    d = min([abs(x-x1) abs(x-x3)]); %Distance from nearest minimum after N steps
    disp(['$' num2str(x_0) '$ & $' num2str(x,10) '$ & $' num2str(d) '$ \\'])

end