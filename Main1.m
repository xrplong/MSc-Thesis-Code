
% Using Euler Method to solve the communication between miners equation.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ADJUST VARIABLES BELOW TO YOUR REQUIREMENTS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lambda = 0.3;   % Choose lambda value > 0
w      = 0.1;   % Choose omega value > 0
N = 2000;       % Choose how many solutions you need (N + 1 solutions)

P = 40;         % Choose how many solution plots you need <= N + 1
                % Not necessary to plot all solutions for very large N
                % since beheviour already noticable for low n

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DONT CHANGE CODE BELOW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Setting solution step size and node count
step = 0.05;
nodes = 100*N + 1;

ylist = zeros(nodes, N);    % 2 dimensional array of solutions
                            % Columns are solutions
                            % Rows are t values

% Metrics want to measure
DerivativeList = zeros(1,N+1); % Want to measure the change in slope for each solution

% Setting time vector and y vector
t = zeros (nodes,1);
y = zeros (nodes,1);

% Setting initial condition y(0) = 1
t(1) = 0;
y(1) = 1;

% Solving iteratively using Euler scheme (n = 0 solution)
for i= 1 : nodes - 1
t(i+1) = t(i) + step;
y(i+1) = y(i) + step.*( -lambda.*y(i) - w.*y(i) + w.*(y(i).^2));
end

% Getting slope of solution @ y=0.5
DerivativeList(1) = slope(t, y);
    
% Saving solution for next n value equation
u = y;
ylist(1:nodes, 1) = y;

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
    y(i+1) = y(i) + step.*( -lambda.*y(i) + lambda.*u(i) - w.*y(i) + w.*(y(i).^2));
    end
    
    % Getting slope of solution @ y=0.5
    DerivativeList(n+1) = slope(t, y);
    
    % Setting solution for next equation to solve
    u = y;
    ylist(1:nodes, n+1) = y;
    n = n + 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Some stuff to help with a nice plot
last_sol = ylist(1:nodes,P);
tol = 0.0003;
for i = 1:nodes
    if last_sol(i) < tol
        break
    end
end

% Plotting our solutions up to P

hold on
for j = 1:P
    plot(t(1:i), ylist(1:i, j))
end
hold off
xlabel('t');
ylabel('\phi_n(t)')
grid on;

% Plotting change in slope over time
figure
hold on
plot(0:N, DerivativeList);
yline(DerivativeList(N+1), '--', num2str(DerivativeList(N+1)));
xlabel('n');
ylabel('slope');
grid on;
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ylabel('slope', 'Rotation', 0, 'Position',[-30 -0.113]);




