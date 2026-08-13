x = -10:1/1000:10;
y = f(x);
plot (x,y)
axis ([-10 10 -10 10])
hold on
plot (x,x)
xlabel('x')

N = 0;
xtep = -5
while N < 4
    N = N+1;
    plot ([xtep f(xtep)], [f(xtep) f(xtep)], '--o', 'Color', '#00841a')
    xtep = f(xtep)
    plot ([xtep xtep], [xtep f(xtep)], '--o', 'Color', '#00841a')
end

legend ('f(x)', 'x', 'iteration')