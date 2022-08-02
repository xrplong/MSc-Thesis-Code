% Measuring the speed of the wave front for increasing n 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ADJUST VARIABLES BELOW TO YOUR REQUIREMENTS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lambda = 0.3;   % Choose lambda value > 0
w      = 0.1;   % Choose omega value > 0
N = 1200;       % Choose how many solutions you need (N + 1 solutions)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DONT CHANGE CODE BELOW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t_position = zeros(1,N+1); % Track velocity for each step of n
                           % We define v(n) = t(n+1)-t(n)

% Setting solution step size and node count
step = 0.005;
nodes = 1000*N + 1;

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
    y(i+1) = y(i) + step.*( -lambda.*y(i) + lambda.*u(i) - w.*y(i) + w.*(y(i).^2));
    end
    
    % Getting t value of phi{n}=0.5 for n = 0
    t_position(n+1) = slope_tval(t, y);
    
    % Setting solution for next equation to solve
    u = y;
    n = n + 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creating velocity vector
velocities = zeros(1,N);
for i = 1:N
    velocities(i) = t_position(i+1) - t_position(i);
end

% Plotting velocity with respect to n
hold on;
plot(0:N-1, velocities);
yline(velocities(N), '--', num2str(velocities(N)));
xlabel('n');
ylabel('velocity \phi_n(t)')
grid on;
hold off;

