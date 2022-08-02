
N = 50;        % Choose how many solutions (N+1) solutions

% SLOPE VS VARIATION IN LAMBDA AND N
l = 0.01;       % Choose lower bound for omega values
L = 3;          % Choose upper bound for omega values (divisable by step)
stepL = 0.01;    % Choose step size for variation in lambda
omegaFixed = 0.5;     % Choose omega fixed

% SLOPE VS VARIATION IN OMEGA AND N
w = 0.01;       % Choose lower bound for omega values
W = 3;          % Choose upper bound for omega values (divisable by step)
stepW = 0.01;    % Choose step size for variation in omega
lambdaFixed = 0.5;     % Choose lambda fixed

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DONT CHANGE CODE BELOW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Nodes and step size for solver (need more nodes for smaller omega/lambda)
nodes = 1200*N + 1;
stepp = 0.01;


% LOOPING THROUGH LAMBDA  AND n VALUES
SlopeArray = zeros(N+1, L/stepL);
col = 1;
for lambda = l:stepL:L
    
    % Metrics want to measure
    DerivativeList = zeros(1,N+1); 

    % Setting time vector and y vector
    t = zeros (nodes,1);
    y = zeros (nodes,1);

    % Setting initial condition y(0) = 1
    t(1) = 0;
    y(1) = 1;

    % Solving iteratively using Euler scheme (n = 0 solution)
    for i= 1 : nodes - 1
        t(i+1) = t(i) + stepp;
        y(i+1) = y(i) + stepp.*( -lambda.*y(i) - omegaFixed.*y(i) + omegaFixed.*(y(i).^2));
    end

    % Getting slope of solution @ y=0.5
    DerivativeList(1) = slope(t, y);

    % Saving solution for next n value equation
    u = y;

    % Solving again for n > 0 solutions
    n = 1;
    while n <= N
        t = zeros (nodes,1);
        y = zeros (nodes,1);
        t(1) = 0;
        y(1) = 1;

        % Solving iteratively using Euler scheme (n > 0 solutions)
        for i= 1 : nodes - 1
        t(i+1) = t(i) + stepp;
        y(i+1) = y(i) + stepp.*( -lambda.*y(i) + lambda.*u(i) - omegaFixed.*y(i) + omegaFixed.*(y(i).^2));
        end

        % Getting slope of solution @ y=0.5
        DerivativeList(n+1) = slope(t, y);

        % Setting solution for next equation to solve
        u = y;
        n = n + 1;
    end
    SlopeArray(1:N+1, col) = DerivativeList;
    col = col + 1;
end

% PLOTTING
figure
[X,Y] = meshgrid(l:stepL:L, 1:N+1);
surf(X, Y, SlopeArray)  
xlabel('\lambda');
ylabel('n');
zlabel('slope', 'Rotation', 0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% LOOPING THROUGH OMEGA  AND n VALUES
SlopeArray = zeros(N+1, W/stepW);
col = 1;
for omega = w:stepW:W
    
    % Metrics want to measure
    DerivativeList = zeros(1,N+1); 

    % Setting time vector and y vector
    t = zeros (nodes,1);
    y = zeros (nodes,1);

    % Setting initial condition y(0) = 1
    t(1) = 0;
    y(1) = 1;

    % Solving iteratively using Euler scheme (n = 0 solution)
    for i= 1 : nodes - 1
        t(i+1) = t(i) + stepp;
        y(i+1) = y(i) + stepp.*( -lambdaFixed.*y(i) - omega.*y(i) + omega.*(y(i).^2));
    end

    % Getting slope of solution @ y=0.5
    DerivativeList(1) = slope(t, y);

    % Saving solution for next n value equation
    u = y;

    % Solving again for n > 0 solutions
    n = 1;
    while n <= N
        t = zeros (nodes,1);
        y = zeros (nodes,1);
        t(1) = 0;
        y(1) = 1;

        % Solving iteratively using Euler scheme (n > 0 solutions)
        for i= 1 : nodes - 1
        t(i+1) = t(i) + stepp;
        y(i+1) = y(i) + stepp.*( -lambdaFixed.*y(i) + lambdaFixed.*u(i) - omega.*y(i) + omega.*(y(i).^2));
        end

        % Getting slope of solution @ y=0.5
        DerivativeList(n+1) = slope(t, y);

        % Setting solution for next equation to solve
        u = y;
        n = n + 1;
    end
    SlopeArray(1:N+1, col) = DerivativeList;
    col = col + 1;
end

% PLOTTING
figure
[X,Y] = meshgrid(w:stepW:W, 1:N+1);
surf(X, Y, SlopeArray)
xlabel('\omega');
ylabel('n');
zlabel('slope', 'Rotation', 0)