format long
% this is a script that involves euler's method which uses a rectangle to
% approximate the solution of a graph at a certain point 

%EXAMPLE 1

% u8se euler's method to 
% solve dy/dx = x + (1/5)y for y(5) = ?? x_naught = 0 and y_naught = -3
% FORMULA: y_n+1 = y_n + hf(x_n,y_n)

x_nf = 4;
x_o = 1;
y_o = 0.5;
h = 0.3 ; %step size of teh example
N = (x_nf - x_o ) / h % no. of iterations


x_n = [];
y_n = [];


for n = 1:N
    x_n(1)= x_o;  
    y_n(1) = y_o ;
    
    func = (-y_n(n)^(3) + x_n(n)^(4) ) / ( (x_n(n)*y_n(n)^(2))...
        + (x_n(n)^(3)*y_n(n)^(1/2))  );
    
    y_n(n+1)= y_n(n) + (h*func) ;
    x_n(n+1) = x_n(n) + h;        
end
vector = [1:1:5]
plot (x_n, y_n)
T = table (x_n' , y_n');
T.Properties.VariableNames = {'x' 'y'}

