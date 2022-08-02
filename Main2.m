% Measuring solution against variation in omega and lambda

N = 10;             % Choose fixed N solution 

% VARIATION IN LAMBDA
omegaFixed = 0.1;    % Choose fixed omega value
L = 2;               % Choose upper bound for lambda values
l = 0.02;            % Choose lower bound for lambda values
stepL = 0.02;        % Choose step size for variation in lambda values


% VARIATION IN OMEGA
lambdaFixed = 0.3;   % Choose fixed Lambda value
W = 2;               % Choose upper bound for omega values
w = 0.02;            % Choose lower bound for omega values
stepW = 0.02;        % Choose step size for variation in omega values

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DONT CHANGE CODE BELOW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Step size and nodes for solver
step = 0.1;
nodes = 500*N + 1;

ylist = zeros(nodes, L/l);

% LOOPING THROUGH LAMBDA VALUES AND PLOTTING
count = 1;
for lambda = l:stepL:L
    % Setting time vector and y vector
    t = zeros (nodes,1);
    y = zeros (nodes,1);

    % Setting initial condition y(0) = 1
    t(1) = 0;
    y(1) = 1;

    % Solving iteratively using Euler scheme (n = 0 solution)
    for i= 1 : nodes - 1
    t(i+1) = t(i) + step;
    y(i+1) = y(i) + step.*( -lambda.*y(i) - omegaFixed.*y(i) + omegaFixed.*(y(i).^2));
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
        t(i+1) = t(i) + step;
        y(i+1) = y(i) + step.*( -lambda.*y(i) + lambda.*u(i) - omegaFixed.*y(i) + omegaFixed.*(y(i).^2));
        end
        
        % Recording solution if n = N
        if n == N
            ylist(1:nodes, count) = y;
        end
        
        u = y;
        n = n + 1;
    end
    count = count + 1;
end

% Some stuff to help with a nice plot
last_sol = ylist(1:nodes,1);
tol = 0.0003;
for i = 1:nodes
    if last_sol(i) < tol
        break
    end
end

figure
hold on
for j = 1:L/l
    plot(t(1:i), ylist(1:i, j))
end
hold off

% plot title and axis
xlabel("t");
ylabel('\phi_{10}(t)')
grid on;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Step size and nodes for solver
step = 0.1;
nodes = 70*N + 1;

ylist = zeros(nodes, W/w);

% LOOPING THROUGH OMEGA VALUES AND PLOTTING
count = 1;
for omega = 0.01:0.01:W
    % Setting time vector and y vector
    t = zeros (nodes,1);
    y = zeros (nodes,1);

    % Setting initial condition y(0) = 1
    t(1) = 0;
    y(1) = 1;

    % Solving iteratively using Euler scheme (n = 0 solution)
    for i= 1 : nodes - 1
    t(i+1) = t(i) + step;
    y(i+1) = y(i) + step.*( -lambdaFixed.*y(i) - omega.*y(i) + omega.*(y(i).^2));
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
        t(i+1) = t(i) + step;
        y(i+1) = y(i) + step.*( -lambdaFixed.*y(i) + lambdaFixed.*u(i) - omega.*y(i) + omega.*(y(i).^2));
        end

        % Recording solution if n = N
        if n == N
            ylist(1:nodes, count) = y;
        end
        
        u = y;
        n = n + 1;
    end
    count = count + 1;
end

% Some stuff to help with a nice plot
last_sol = ylist(1:nodes,1);
tol = 0.0003;
for i = 1:nodes
    if last_sol(i) < tol
        break
    end
end

figure
hold on
for j = 1:W/w
    plot(t(1:i), ylist(1:i, j))
end
hold off

% plot title and axis
xlabel("t");
ylabel('\phi_{10}(t)')
grid on;
