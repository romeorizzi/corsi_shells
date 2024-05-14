= Meeting 2024-04-16: i linguaggi di si e no della Programmazione Lineare (PL)
#text(style:"italic", size:11pt, [Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])


```
Today we explore duality theory (chapter 5 of the book)

max z = 5x1 + 4x2 + 3x3
    2x1 + 3x2 + x3 ≤ 5
    4x1 + x2 + 2x3 ≤ 11
    3x1 + 4x2 + 2x3 ≤ 8
    x1, x2, x3 ≥ 0

We noticed that if we assign non-negative multipliers to each technical inequality of the standard form, in such a way that the gradient of the objective function z is dominated by the gradient of the conic combination of the constraints, then we yield a valid upper bound on z.

Example:

               2x1 + 3x2 + x3  ≤ 5    (*3)
               4x1 +  x2 +2x3  ≤ 11   (*0)
               ___________________
               6x1 + 9x2 + 3x3 ≤ 15
	       \/    \/    \/ 
therefore, z =  5x1 + 4x2 + 3x3 ≤ 6x1 + 9x2 + 3x3 ≤ 15 

Actually, our good conjecture (now proven by the simplex algorithm),
it that this language is good enough to prove optimality of an optimal solution.

This leads us to define the dual linear program:
   in practice, we pose ourself the problem of finding the best multipliers:
      those that minimize the upper-bound (make it the strongest possible) while respecting the non-negativity of the multipliers and the needed dominance property.

Let's first do it with our hands for the example problem:


PRIMAL example PROBLEM:

max z = 5x1 + 4x2 + 3x3
    2x1 + 3x2 + x3  ≤  5     <-- associate multiplier y1 >= 0
    4x1 +  x2 + 2x3 ≤ 11     <-- associate multiplier y2 >= 0
    3x1 + 4x2 + 2x3 ≤  8     <-- associate multiplier y3 >= 0
    x1, x2, x3 ≥ 0

coefficient of x1 in the conic combination of the constraints should dominate c1 = 5:
   2y1 + 4y2 + 3y3   >= 5

coefficient of x2 constraint:
   3y1 + y2 + 4y3 >= 4

coefficient of x3 constraint:
   y1 + 2y2 + 2y3 >= 3

objective function: we want the upper bound to be as strong as possible

but what is the bound that we obtain? It is the know-term in the conic combination inequality produced. This is availability_1 * y_1 + availability_2 * y_2 + availability_3 * y_3 

   min 5y1 +11y2 + 8 y3
   2y1 + 4y2 + 3y3   >= 5
   3y1 + y2 + 4y3 >= 4
   y1 + 2y2 + 2y3 >= 3
   y1 >= 0, y2 >= 0, y3 >= 0

amzsing! we could express the problem of producing a strongest possible upper-bound in the good-conjectured NO-language as an LP.

Thus, yes and no speak the same language for LP problems.

More in general, given an LP problem in standard form:

max sum_(j=1)^n c_j x_j                          max c'x
   \sum_(j=1)^n A[i,j] x_j <= b_i,  i=1,...,m    Ax <= b
   x_j >= 0, j=1,...,n                            x >= 0

its dual (= the LP that models the problem of yielding a strongest possible upper-bound of out beloved form on the primal) is:

min sum_(i=1)^m b_i y_j                          min b'y
   \sum_(i=1)^n A[i,j] y_i >= c_j,  j=1,...,n    A'y >= c
   y_i >= 0, i=1,...,m                            y >= 0

Therefore, when we have a linear program and we strive for its optimization it so happens:
  1. the yes certificate has the form of a feasible solution (achieving a certain objective function value and assuring it) for the primal
  2. the no certificate has the form of a feasible solution of the dual problem (achieving a certain objective function value and assuring it) for the dual

Now, the dual is also a linear program. As such, we could begin to suspct that the dual of the dual is the primal. If so, it might even be the case (and it will be) that primal and dual are one and the same face of an unique entity (like the magnetic poles that do not exist in separate).

Let's check that when we dualize the dual we come back to the primal.

Let's try to write the dual of the following problem (the dual of a primal problem in standard maximization form):

 min b'y
 A'y >= c
  y >= 0

The dual is not in  standard maximization form, in fact it is not a maximization but a minimization problem (we call its form the standard minimization form).

This means that we do not yet know the process that generated its dual.

We have two options in order to proceed:
1. either we first carry it in standard maximization form and then apply the process we just learned

2. we conjecture what the dual could be and use that (and/or verify it against option 1)


Let's do 2 first (and then 1) so that we grow up brave in self-confidence:
min sum_(i=1)^m b_i y_i                          min b'y
   \sum_(i=1)^n A[i,j] y_i >= c_j,  j=1,...,n    A'y >= c
   y_i >= 0, i=1,...,m                            y >= 0

We already know the musik: the game shold be about making conic combinations of the constraints in such a way to obtain a conservative estimate on the objective function.

max sum_(j=1)^n c_jw_j                           max c'w
   \sum_(j=1)^m A[i,j] w_j <= b_i, i=1,...,m         Aw <= b
   w_j >= 0, j=1...,n                            w >= 0

which is indeed the same as the primal problem we started from (except for the name of the variables, we couldn't know their name was x rather than w).


That was so easy that maybe is not worth doing it the careful way (you can find it in the book and is more tedious)

We got courage that we could use to find out how to dualize a general LP problem without having to carry it in standard form first.


General maximization LP problem:

actually, NO, let's generalize bit by bit a step at the time

first generalization:

max sum_(j=1)^n c_j x_j                          max c'x
   \sum_(j=1)^n A^1[i,j] x_j <= b_i,  i=1,...,m    A^1x <= b^1
   \sum_(j=1)^n A^2[i,j] x_j >= b_i,  i=1,...,m    A^2x >= b^2
   x_j >= 0, j=1,...,n                            x >= 0


min b^1'y_1 + b^2'y_2
A_1'y_1 + A'_2y_2 >= c
y_1 >= 0, y_2 <= 0


second generalization:

max c'x
  A^1x <= b^1
  A^2x >= b^2
  A^3x = b^3
  x >= 0


min b^1'y_1 + b^2'y_2 + b^3'y_3
A_1'y_1 + A'_2y_2 + A'_3y_3 >= c
y_1 >= 0, y_2 <= 0, y_3 free

third generalization:

max c'x
  A^1(x_1',x_2')' <= b^1
  A^2(x_1',x_2')' >= b^2
  A^3x = b^3
  x_1 >= 0, x_2 <= 0 

min b^1'y_1 + b^2'y_2 + b^3'y_3
A_1'y_1 + A'_2y_2 + A'_3y_3 >= c
y_1 >= 0, y_2 <= 0, y_3 free


ok, we got the idea that courage and intuition are better than memorizing anfd getting stack and rigid.

Weak duality theorem [duality no theorem, it only states that the dual offers a bound on the primal]: let x be a feasible solution for (P) and y be a feasible solution for (D). Then c'x <= b'y.

Silly Corollary: if P (or D) is unbounded than D (or P) is unfesible. 

Celebrated Corollary: if x feasible for P and y feasible for D with c'x = b'y then x is optimum for P and y is optimum for D. 

Strong duality theorem [good theorem]: if (P) as an optimal solution x* then also (D) has an optimal solution, and c'x* = b'y*.


max   c_1 x1 +c_2 x_2      min y1 
      x1       <= 1             y1     >= c1
          - x2 <= 0                -y2 >= c2 >0
      x1,x2 >=0             y1, y2 >= 0

So, primal and dual can be both unfeasible.

Complementarity theorem [good theorem, an equivalent form]: if (x*,w*) >= 0 is optimal for (P) and (t*,y*) >= 0 is optimal for (D) then (x*,w*)(t*,y*) = 0.
                                                              n  m   n  m
Conversely, if (x*,w*) is feasible for (P) and (t*,y*) is feasible for (D) and they satisfy the above m+n complementarity constraints then they are both optimal.

```
