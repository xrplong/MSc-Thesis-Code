% Measuring the speed of the wave front for increasing n and lambda

N = 100;             % Choose how many solutions you need (N + 1 solutions)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ADJUST VARIABLES BELOW TO YOUR REQUIREMENTS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% VELOCITY VS VARIATION IN LAMBDA AND N
l = 0.02;            % Choose lambda lower bound
L = 1;               % Choose lambda upper bound
stepL = 0.02;        % Choose lambda step size
omegaFixed = 0.1;    % Choose omega value fixed

% VELOCITY VS VARIATION IN OMEGA AND N
w = 0.02;            % Choose omega lower bound
W = 1;               % Choose omega upper bound
stepW = 0.02;        % Choose omega step size
lambdaFixed = 0.1;   % Choose lambda value fixed

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DONT CHANGE CODE BELOW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Setting solution step size and node count
step = 0.05;
nodes = 1000*N + 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VELOCITY VS VARIATION IN LAMBDA AND N
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
surface = zeros(N, L/l); % want surface plot with
                             % x_axis - n values
                             % y_axis - lambda values
                             % z_axis - velocities

% Looping through lambda values
count = 1;
for lambda = l:stepL:L
    
    t_position = zeros(1,N+1);   % Track velocity for each step of n
                                 % We define v(n) = t(n+1)-t(n)
                             
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

    % Getting t value of phi{n}=0.5 for n = 0
    t_position(1) = slope_tval(t, y);

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
        t(i+1) = t(i) + step;
        y(i+1) = y(i) + step.*( -lambda.*y(i) + lambda.*u(i) - omegaFixed.*y(i) + omegaFixed.*(y(i).^2));
        end

        % Getting t value of phi{n}=0.5 for n = 0
        t_position(n+1) = slope_tval(t, y);

        % Setting solution for next equation to solve
        u = y;
        n = n + 1;
    end

    % Creating velocity vector
    velocities = zeros(1,N);
    for i = 1:N
        velocities(i) = t_position(i+1) - t_position(i);
    end
    
    % Updating surface array
    surface(1:N, count) = velocities;
    count = count + 1;
end

% Plotting velocity vs n, lambda variation
figure
[X,Y] = meshgrid(0:N-1, l:stepL:L);
surf(X, Y, surface')  
xlabel('n');
ylabel('\lambda');
zlabel('velocity \phi_n(t)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VELOCITY VS VARIATION IN OMEGA AND N
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

surface = zeros(N, W/w);     % want surface plot with
                             % x_axis - n values
                             % y_axis - omega values
                             % z_axis - velocities

% Looping through omega values
count = 1;
for omega = w:stepW:W
    
    t_position = zeros(1,N+1);   % Track velocity for each step of n
                                 % We define v(n) = t(n+1)-t(n)
                             
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

    % Getting t value of phi{n}=0.5 for n = 0
    t_position(1) = slope_tval(t, y);

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
        t(i+1) = t(i) + step;
        y(i+1) = y(i) + step.*( -lambdaFixed.*y(i) + lambdaFixed.*u(i) - omega.*y(i) + omega.*(y(i).^2));
        end

        % Getting t value of phi{n}=0.5 for n = 0
        t_position(n+1) = slope_tval(t, y);

        % Setting solution for next equation to solve
        u = y;
        n = n + 1;
    end

    % Creating velocity vector
    velocities = zeros(1,N);
    for i = 1:N
        velocities(i) = t_position(i+1) - t_position(i);
    end
    
    % Updating surface array
    surface(1:N, count) = velocities;
    count = count + 1;
end

% Plotting velocity vs n, lambda variation
figure
[X,Y] = meshgrid(0:N-1, w:stepW:W);
surf(X, Y, surface')  
xlabel('n');
ylabel('\omega');
zlabel('velocity \phi_n(t)');
