function [Theta, X1] = LovTheta(G)
% phi_lin Computes formulation of phi_quad for a graph of size n
%  max (0): tr(Y*J)
% s.t. (1): tr(Y)=1
%      (2): Y(i,j)=0 if (i,j) an edge
%      (3): Y is symmetric positive semidefinite
%   Input - adjacency matrix for a graph G, size n x n

[numRows, n] = size(G);

% Construct and solve the model
J = ones(n);
cvx_begin sdp quiet
    % Condition (3)
    variable Y(n,n) semidefinite; 
    % Condition (1)
    trace(Y) == 1;
    % Objective (0)
    maximize( trace(Y*J) );
    for i=1:n
        for j=1:n
            if(G(i,j)==1)
                % Condition (2)
                Y(i,j) == 0;
            end
        end
    end
cvx_end


Theta = (trace(Y*J));
X1 = Y;
end

