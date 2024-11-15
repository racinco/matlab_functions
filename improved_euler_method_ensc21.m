% this script uses Improved euler method to approximate the solution of a 
% differential function unlike euelr which uses rectangles 
% improved euler uses trapezoid 

% the formula for Imporved Euler Method is y_n+1 = y_n +0.5(k_1 + k_2 )
% whereas k_1 = h*f(x_n, y_n)
% whreas k_2 = h*f(x_n + h, y_n + h)

% EXMAPLE 1 
% solve using Improved Euler Method the diff equation dy/dx = x + y 
% whereas y(0) =1 
% when x = 1, use h =0.1 

h =0.3; % initialize the given parameters 
x_nf = 4; 
x_o = 1;
y_o = 0.5;

N =(x_nf - x_o)/ h; % initialize the number of iterations

x_n = [];   % initialize Empty Sets to be filled with data 
y_n = [];
k_1 = [];
k_2 = [];

for n = 1:N % iterations and formulas 
    x_n(1) = x_o;
    y_n(1) = y_o;
    
    func_1 = (-y_n(n)^(3) + x_n(n)^(4) ) / ( (x_n(n)*y_n(n)^(2))...
        + (x_n(n)^(3)*y_n(n)^(1/2))  );  
    k_1(n) = h * func_1;
    
    func_2 = (-(y_n(n) + k_1(n) )^(3) + (x_n(n) + h )^(4) ) / ( ((x_n(n) + h)*(y_n(n) + k_1(n) )^(2))...
        + ((x_n(n) + h)^(3)*(y_n(n) + k_1(n) )^(1/2))  );
    k_2(n)= h * func_2;
    
    y_n(n+1)= y_n(n) + 0.5*(k_1(n) + k_2(n));
    x_n(n+1) = x_n(n) + h;   
end

k_1(N+1) = 0;
k_2(N+1)= 0;

plot ( x_n , y_n )
T = table ( x_n' , y_n', k_1' , k_2');
T.Properties.VariableNames = {'x' 'y' 'k_1' 'k_2'}


