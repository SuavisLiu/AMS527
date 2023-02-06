%%  Problem 1
%% Finite Difference 
clc; clear; close all
format long
f = @(x) tan(x);
err_list = zeros(1,17);
err_list_single = zeros(1,17);
h_list = zeros(1,17);
for k = [0:16]
    h = 10^(-k);
    h_list(k+1) = h;
    df = (f(1+h) - f(1))/h;
    df_single = single((f(1+h) - f(1))/h);
    f_p = tan(1)^2 + 1;
    f_p_single = single(tan(1)^2 + 1);
    err = norm(f_p - df);
    err_single = norm(f_p_single - df_single);
    err_list(k+1) = err;
    err_list_single(k+1) = err_single;
end

loglog(h_list,err_list,h_list,err_list_single)
xlabel('step size')
ylabel('error')
title('FinDiff: Loglog of error vs. step size')
legend('double','single')

%% Centered Difference 
clc; clear; close all
format long
f = @(x) tan(x);
err_list = zeros(1,17);
err_list_single = zeros(1,17);
h_list = zeros(1,17);
for k = [0:16]
    h = 10^(-k);
    h_list(k+1) = h;
    df = (f(1+h) - f(1-h))/2*h;
    df_single = single((f(1+h) - f(1-h))/2*h);
    f_p = tan(1)^2 + 1;
    f_p_single = single(tan(1)^2 + 1);
    err = norm(f_p - df);
    err_single = norm(f_p_single - df_single);
    err_list(k+1) = err;
    err_list_single(k+1) = err_single;
end

loglog(h_list,err_list,h_list,err_list_single)
xlabel('step size')
ylabel('error')
title('CenDiff: Loglog of error vs. step size')
legend('double','single')

%% Problem 2
clc; clear; close all

x_list = zeros(1,20);
x_list(1) = 11/2;
x_list(2) = 61/11;

for k = [3:20]
    x_list(k) = double(111-(1130-3000/x_list(k-2))/x_list(k-1));
end

x_list

k = [1:20];
plot(k,x_list)
title('x in each iteration')
xlabel('k')
ylabel('x')

%% Problem 3
clc; clear; close all
format short
% Solve ax^2 + bx + c = 0 by standard/alternative quadratic formula.

a = 1e-155;
b = -1e155;
c = 1e155;

if a == 0 && b ~= 0
    x1 = 2*c/(-b-sqrt(b^2-4*a*c))
elseif abs(a) > intmax && abs(b) > intmax && abs(c) > intmax
    a1 = a/a;
    b1 = b/a;
    c1 = c/a;
    x1 = (-b1+sqrt(b1^2-4*a1*c1))/(2*a1)
    x2 = (-b1-sqrt(b1^2-4*a1*c1))/(2*a1)
elseif abs(a/b) < 1e-64 && abs(b) > intmax && abs(c) > intmax
    a = 0;
    b1 = b/b;
    c1 = c/b;
    x1 = 2*c1/(-b1-sqrt(b1^2))
else
    x1 = (-b+sqrt(b^2-4*a*c))/(2*a)
    x2 = (-b-sqrt(b^2-4*a*c))/(2*a)
end

%% Problem 4

clc; clear; close all

tol = 1e-4;
err = 10;
iter = 0;
x = 0.6;
xlist = [];
while err > tol && iter < 1000
    x = x + (x - 1)^2;
    xlist = [xlist x];
    iter = iter + 1;
    err = abs(1 - x)
end


plot (xlist)
title('x-value')
xlabel('iteration')
ylabel('x')






