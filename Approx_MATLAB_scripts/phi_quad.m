function [Theta, A] = phi_quad(G)
% phi_quad Computes SDP formulation of phi_quad for a graph of size n
% See Proposition 4.12 for explicit program
% phi_quad(G) = tr(A*J)/n, where A equals
%  argmin (0): t
%    s.t. (1): A(i,i)=1
%         (2): A(i,j)=0 if (i,j) not an edge
%         (3): t >= ||A-J||^2, in Schur complement form
%         (4): A is symmetric positive semidefinite
%   Input - adjacency matrix for a graph G, size n x n

[numRows, n] = size(G);

% Construct and solve the model
J = ones(n);
P = eye(n)+G;
cvx_precision best
cvx_begin sdp quiet
    % Condition (4)
    variable M(n^2+n+1,n^2+n+1) symmetric semidefinite;
    variable t
    % Objective (0)
    minimize( t );
    % Condition (3)
    M(1:n, n+1:n^2+n+1) == zeros(n, n^2+1);
    M(1+n:n^2+n, 1+n:n^2+n) == eye(n^2);
    for i = 1:n
        for j = 1:n
            % Condition (1)
            M(i,i) == 1;
            if (G(i,j) == 0) && (i ~= j)
                % Condition (2)
                M(i,j) == 0;
            end
        end
    end
    % Condition (3)
    for i = 0:(n^2-1)
        q = floor(i/n);
        r = mod(i,n);
        M(n+1+i,n^2+n+1) == M(r+1,q+1);
    end
    M(n^2+n+1,n^2+n+1) - t == (2*trace(P*M(1:n,1:n))-1*trace(P*P));
    
cvx_end


A = M(1:n,1:n);
Theta = trace(J*A)/n;
end

