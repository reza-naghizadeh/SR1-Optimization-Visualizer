clear all;
clc;

% Define the equation
syms x1 x2;
f(x1, x2) = (10 * x1 ^ 2) - (4 * x1 * x2) + (x2 ^ 2);

% plot the contour plot
fcontour(f, 'Fill', 'on');
% To show the color bar next to the plot
colorbar
% For 3d plot //// I just coment it because it doesn't look good
% fsurf(f);
% To hold the plot so we can show the update of point on it
hold on

% The diviation of equation
gx = gradient(f);

% Learing Rate (alpha)
learningRate = 0.1;

% Initial point given by homework
x = [-2, 2.5];

% r is a small number between 0 and 1 to use it inside the SR1 condition
r = 1E-8; 

% Initial inverse Hessian matrix
Hk = eye(size(x, 2));

% Compute the gradient in Initial point
xResult = double(subs(gx(x(1, 1), x(1, 2)),{x1,x2},{x(1,1),x(1,2)}));

% Two empty list to save the points during the update
x1List = [x(1, 1)];
x2List = [x(1, 2)];


for i = 1:1000

    % SR1 update
    x = x - (learningRate * Hk * xResult)';

    % Save the points inside the empty list for further use
    x1List = [x1List x(1, 1)]; %#ok
    x2List = [x2List x(1, 2)]; %#ok
    
    % Compute the gradient in new point
    xResult = double(subs(gx(x(1, 1), x(1, 2)),{x1,x2},{x(1,1),x(1,2)}));

    % compute the variables to use in SR1 condition
    pk = Hk * -xResult;
    % Next point
    nextX = x + (learningRate * pk');
    yk = double(subs(gx(nextX(1, 1), nextX(1, 2)),{x1,x2},{x(1,1),x(1,2)})) - xResult; 
    xk = learningRate * pk;

    if abs(((xk - (Hk * yk))' * yk)) >= r * norm((xk - (Hk * yk))) * norm(yk)
        Hk = Hk + (((xk - (Hk * yk)) * (xk - (Hk * yk))') / ((xk - (Hk * yk))' * yk));
    end
    
    % Break the iteration
    % Check if the points don't change more than 10e-4 and if so break
    errorAmountx1 = x1List(1, i)  - x(1, 1);
    errorAmountx2 = x2List(1, i)  - x(1, 2);
    if (errorAmountx1 < 10e-4 && errorAmountx2 < 10e-4)
        break
    end

        % Plot the point on contour 
%     plot(x(1, 1), x(1, 2), 'r-*');
%     title('Iteration = ', i )
%     pause(0.1)
end

% After finding the min point print out the results
disp('Iteration = ');
disp(i);
disp('The Min Point = ');
disp(x);
disp('Final x in equation : ')
fResult = double(subs(f(x(1,1), x(1,2)),{x1,x2},{x(1,1),x(1, 2)}));
disp(fResult);
plot(x1List, x2List, 'r-*');
