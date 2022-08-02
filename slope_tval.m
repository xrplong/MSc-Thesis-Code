% Takes as inuput a time array and output value array
% Returns the approximate t value at y = 0.5.

function tval = slope_tval(t, y)

    % Finding the t value closest to y(t) = 0.5
    [val,idx]=min(abs(y-0.5));
    y_val=y(idx);
    y_index = find(y == y_val);
    tval = t(y_index);
end