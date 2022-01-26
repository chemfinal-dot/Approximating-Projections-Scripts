function [Theta, A] = phi_lin(G)
% phi_lin Computes formulation of phi_lin for a graph of size n
%  max (0): tr(Y*J)/n
% s.t. (1): Y(i,i)=1
%      (2): Y(i,j)=0 if (i,j) not an edge
%      (3): Y is symmetric positive semidefinite
%   Input - adjacency matrix for a graph G, size n x n

[numRows, n] = size(G);

% Construct and solve the model
J = ones(n);
cvx_precision best
cvx_begin sdp quiet
    % Objective (3)
    variable M(n,n) symmetric semidefinite;
    % Objective (0)
    maximize( trace(J*M) );
    for i = 1:n
        for j = 1:n
            % Objective (1)
            M(i,i) == 1;
            if (G(i,j) == 0) && (i ~= j)
                % Condition (2)
                M(i,j) == 0;
            end
        end
    end
    
cvx_end


Theta = trace(J*M)/n;
end

