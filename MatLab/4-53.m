clear all
n    = 1000;
t0   = 0; t1 = 100;
y10  = 10000;
lambda1 = -0.1;   
lambda2 = -0.03; 

dt = (t1-t0)/n;

T  = zeros(n+1,1);
Y1 = zeros(n+1,1);
Y2 = zeros(n+1,1);

T(1)  = t0;
Y1(1) = y10;
Y2(1) = 0;  

for i = 2:n+1
    T(i) = T(i-1) + dt;
    Y1(i) = Y1(i-1) + dt * (lambda1 * Y1(i - 1));
    Y2(i) = Y2(i-1) + dt * (lambda2 * Y2(i - 1) - lambda1 * Y1(i - 1));
end

Y1_exact = y10 * exp(lambda1 * T);

Y2_exact = y10 * (-lambda1)/(lambda2-lambda1) * (exp(lambda2*T) - exp(lambda1*T));

figure;
p1 = plot(T, Y1_exact, 'LineWidth',4); 
hold on
p2 = plot(T, Y1, 'o-', 'LineWidth',1); 
p3 = plot(T, Y2_exact, 'LineWidth',4);
p4 = plot(T, Y2, 'o-', 'LineWidth',1);
legend('y_1 exact','y_1 Euler','y_2 exact','y_2 Euler','Location','northeast');
xlabel('t'); ylabel('Anzahl Kerne');
grid on;
hold off;

