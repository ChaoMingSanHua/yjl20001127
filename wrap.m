function [theta, number] = wrap(theta)
number = fix(theta / (2 * pi));
theta = theta - number * 2 * pi;
if (theta > pi)
    theta = theta - 2 * pi;
    number = number + 1;
elseif theta < -pi
    theta = theta + 2 * pi;
    number = number - 1;
end