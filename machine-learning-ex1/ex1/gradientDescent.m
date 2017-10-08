function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

    dTheta0 = 0;
    dTheta1 = 0;
    for i = 1:m
        partial = (theta(1) * X(i, 1) + theta(2) * X(i, 2)) - y(i);
        dTheta0 += partial;
        dTheta1 += partial * X(i, 2);
    end
    dTheta0 *= 1 / m;
    dTheta1 *= 1 / m;

    temp0 = theta(1) - alpha * dTheta0;
    temp1 = theta(2) - alpha * dTheta1;

    theta = [temp0; temp1];
end

end
