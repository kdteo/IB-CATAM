%data is hardcoded from values in the report

hold on
plot(0:10, [0.34591 0.34567 0.34627 0.34529 0.34599 0.35074 ...
    0.34456 0.34283 0.35896 0.33609 0.33364], 'b')
plot(0:10, [0.65289 0.65299 0.65273 0.65315 0.65285 0.65077 ...
    0.65347 0.65421 0.64707 0.65704 0.65805], 'r')

hold off

xlabel('k');
lgd=legend('\mu', '\sigma^2', location='northeastoutside');