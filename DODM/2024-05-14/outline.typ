= Meeting 2024-05-07: modeling bipartite matching
#text(style:"italic", size:11pt, [Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])

== the convenience of modeling problems in PLI terms

We have proven that Integer Linear Programming (ILP) is NP-hard.
Before than that we have reduced the Pirellone Problem both to SAT and to ILP (the formulation in terms of ILP was quite easier).


== matchings

A _matching_ in a graph $G=(V,E)$ is a subset $M subset E$ of its edges such that no two edges in $M$ are incident to a same node.

A graph is called _bipartite_ if it is $2$-colorable, i.e., its nodes can be colored using two colors in such a way that, for every edge $e= u v in E$ its two endnodes have different colors.

Objective: calculate a maximum cardinality matching

We worked on a graph of 6 nodes: A,B,C,a,b,c
and 5 edges:

- $A a$
- $A b$
- $A c$
- $B a$
- $C a$

We formulated the problem in terms of integer linear programming and moved on to continuous relaxation.
In continuous relaxation we applied the theory of duality.
The weak duality theorem already provides us with a combinatorial bound.
Inspired by the strong duality theorem, we ask ourselves about the entirety of the polytopes involved.

Definition: a matrix is ​​said to be totally unimodular if each of its square submatrices has determinant in ${0, 1, -1}$. In particular, each of its entries is in ${0, 1, -1}$.

We have observed how totally unimodular matrices lead to integer polytopes/polyhedra.

We have shown that node-edge adjacency matrices of bipartite graphs are fully unimodular.
