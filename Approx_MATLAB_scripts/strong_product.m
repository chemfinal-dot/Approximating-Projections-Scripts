function M = strong_product(G1,G2)
%   strong_product returns the strong graph product of two matrices
%   Input - adjacency matrix for graphs G1 and G2, sizes n1 x n1 and n2 x n2

[numRows, n1] = size(G1);
[numRows, n2] = size(G2);

M = kron(G1+eye(n1),G2+eye(n2)) - eye(n1*n2);
end

