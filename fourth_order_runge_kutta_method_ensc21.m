% this script is used to solve 4th Order Runge Kutta Method, this method
% uses 4 steps to make a more accurate solution to a differential equation
% It uses the FORMULA: y_n+1 = y_n + (1/6)(k_1 + 2k_2 + 2k_3 + k_4 ) 
% whereas k_1 = h * f (x_n, y_n)
% whereas k_2 = h * f (x_n + h/2 , y_n + k_1 /2)
% whereas k_3 = h * f (x_n + h/2 , y_n + k_2 /2)
% whereas k_4 = h * f (x_n + h , y_n + k_3)

% EXAMPLE 1
% solve for the solution to diff eqn @ x =1 
% when y(0) = 1
% diff equation: dy/dx = f(x_n,y_n) = x + y
% h = 0.1

%Initializing the initial given parameters 

x_nf = 4;
x_o = 1 ;
y_o = 0.5 ;
h = 0.3;

% solve for the number of iterations
N = (x_nf - x_o)/ h;

% Initialize the empty sets to be filled with data
y_n = [];
x_n = [];
k_1 = [];
k_2 = [];
k_3 = [];
k_4 = [];

for n = 1:N % for iterations anf formulas 
    x_n(1) = x_o;
    y_n(1) = y_o;
    
    func_1 = (-y_n(n)^(3) + x_n(n)^(4) ) / ( (x_n(n)*y_n(n)^(2))...
        + (x_n(n)^(3)*y_n(n)^(1/2))  );
    k_1(n)= h * func_1;
    
    func_2 = (-( y_n(n) + (k_1(n) /2) )^(3) + ( x_n(n) + (h/2) )^(4) ) / ( (( x_n(n) + (h/2) )*( y_n(n) + (k_1(n) /2) )^(2))...
        + (( x_n(n) + (h/2) )^(3)*( y_n(n) + (k_1(n) /2) )^(1/2))  );
    k_2(n)= h * func_2;
    
    func_3 = (-( y_n(n) + (k_2(n) /2) )^(3) + ( x_n(n) + (h/2) )^(4) ) / ( (( x_n(n) + (h/2) )*( y_n(n) + (k_2(n) /2) )^(2))...
        + (( x_n(n) + (h/2) )^(3)*( y_n(n) + (k_2(n) /2) )^(1/2))  );
    k_3(n)= h * func_3;
    
    func_4 = (-( y_n(n) + (k_3(n)) )^(3) + ( x_n(n) + (h) )^(4) ) / ( (( x_n(n) + (h) )*( y_n(n) + (k_3(n)) )^(2))...
        + (( x_n(n) + (h) )^(3)*( y_n(n) + (k_3(n)) )^(1/2))  );
    k_4(n)= h * func_4;
    
    y_n(n+1) = y_n(n) + ((1/6)*( (k_1(n)) + (2* k_2(n)) + (2* k_3(n)) + (k_4(n)) ))
    x_n(n+1) = x_n(n) + h;
end

k_1(N+1) = 0;
k_2(N+1) = 0;
k_3(N+1) = 0;
k_4(N+1) = 0;
plot (x_n, y_n)
T = table ( x_n' , y_n' , k_1' , k_2' , k_3' , k_4' );
T.Properties.VariableNames = {'x' 'y' 'k_1' 'k_2' 'k_3' 'k_4'}





