# Approximating-Projections-Scripts
This github holds all the code that was used in the paper "Approximating Projections by Quantum Operations" by Roy Araiza, Colton Griffin, Aneesh, Khilnani, and Thomas Sinclair. Here is a description of each of the scripts in this folder. The only required package for these scripts is [CVX](http://cvxr.com/cvx/).

## LovTheta.m
Input: Adjacency matrix G of an undirected graph.

Output: A tuple containing two entries: the [Lovasz Theta](https://en.wikipedia.org/wiki/Lovász_number) for the graph given by a semidefinite program, and the argument that provides the optimal solution for the problem. This script uses CVX to solve the SDP.

## complete.m
Input: A positive integer n.

Output: A tuple containing the adjacency matrix for a [complete graph](https://mathworld.wolfram.com/CompleteGraph.html) of size n, the size n of the graph, and the independence number of the graph, which is 1.

## counter_examples.m
This script calculates the values given in the paper, which are used to serve as counterexamples to several inequalities from Proposition 4.19.

## edge.m
Input: Nonnegative integers i and j, and a positive integer n.

Output: The elementary basis matrix E_ij, which contains all zeros but a 1 in the (i,j) index.

## path_func.m
Input: A positive integer n.

Output: A tuple containing the adjacency matrix for a [path graph](https://mathworld.wolfram.com/PathGraph.html) of size n, the size n of the graph, and the independence number of the graph.

## phi_lin.m
Input: Adjacency matrix G of an undirected graph.

Output: A tuple containing two entries: the value phi_lin given by a semidefinite program (Corollary 4.12), and the argument that provides the optimal solution for the problem. This script uses CVX to solve the SDP.

## phi_quad.m
Input: Adjacency matrix G of an undirected graph.

Output: A tuple containing two entries: the value phi_quad given by a semidefinite program (Corollary 4.12), and the argument that provides the optimal solution for the problem. This script uses CVX to solve the SDP.

## star.m
Input: A positive integer n.

Output: A tuple containing the adjacency matrix for a [star graph](https://mathworld.wolfram.com/StarGraph.html) of size n, the size n of the graph, and the independence number of the graph, which is 1 for n=1 and n-1 otherwise.

## strong_product.m
Input: Two adjacency matrices G1 and G2 for undirected graphs.

Output: The adjacency matrix for the [strong graph product](https://en.wikipedia.org/wiki/Strong_product_of_graphs) of the two graphs.

## wheel.m
Input: A positive integer n.

Output: A tuple containing the adjacency matrix for a [wheel graph](https://mathworld.wolfram.com/WheelGraph.html) of size n, the size n of the graph, and the independence number of the graph, which is floor((n-1)/2).
