function [M] = edge(i,j,n)
% Returns elementary matrix, 0's everywhere and 1 at the (i,j) spot

M=zeros(n);
M(i,j)=1;
end

