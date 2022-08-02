% Measuring slope vs variation in lambda and omega w/ n = 10 fixed

% Choose solution n and omega w value fixed
N = 10;         % Choose fixed n solution
w = 0.05;       % Choose lower bound for omega values
l = 0.05;       % Choose lower bound for lambda values
W = 5;          % Choose upper bound for omega values (divisable by step)
L = 5;          % Choose upper bound for lambda values (divisable by step)
step = 0.05;    % Choose step size for variation in W & L

% Nodes and step size for solver (need more nodes for smaller omega/lambda)
nodes = 1200*N + 1;
stepp = 0.01;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DONT CHANGE CODE BELOW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% LOOPING THROUGH LAMBDA AND OMEGA VALUES

SlopeArray = zeros(W/step, L/step);

row = 1;
for omega = w:step:W
    col = 1;
    for lambda = l:step:L
        % Setting time vector and y vector
        t = zeros (nodes,1);
        y = zeros (nodes,1);

        % Setting initial condition y(0) = 1
        t(1) = 0;
        y(1) = 1;

        % Solving iteratively using Euler scheme (n = 0 solution)
        for i= 1 : nodes - 1
            t(i+1) = t(i) + stepp;
            y(i+1) = y(i) + stepp.*( -lambda.*y(i) - omega.*y(i) + omega.*(y(i).^2));
        end
    
        % Set solution for next equation
        u = y;

        % Solving again for n > 0 solutions
        n = 1;
        while n <=N
            t = zeros (nodes,1);
            y = zeros (nodes,1);
            t(1) = 0;
            y(1) = 1;

            % Solving iteratively using Euler scheme (n > 0 solutions)
            for i= 1 : nodes - 1
            t(i+1) = t(i) + stepp;
            y(i+1) = y(i) + stepp.*( -lambda.*y(i) + lambda.*u(i) - omega.*y(i) + omega.*(y(i).^2));
            end

            u = y;
            n = n + 1;
        end
        
        SlopeArray(row,col) = slope(t,y);
              
        col = col + 1;
    end
    row = row + 1;
end

% PLOTTING
[X,Y] = meshgrid(w:step:W, l:step:L);
surf(X, Y, SlopeArray')     
xlabel('\omega');
ylabel('\lambda');
zlabel('slope', 'Rotation', 0);





