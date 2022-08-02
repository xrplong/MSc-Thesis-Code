% Takes as inuput a time array and output value array
% Returns the approximate derivative at y = 0.5.

function D = slope(t, y)

    % Finding the y value closest to 0.5
    [val,idx]=min(abs(y-0.5));
    y_val=y(idx);
    y_index = find(y == y_val);
    
    % Solving derivative
    D = (y(y_index + 1) - y(y_index - 1))/(t(y_index + 1) - t(y_index - 1));
end
