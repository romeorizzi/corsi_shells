= 2024-03-12: ancobuone caratterizzazioni (problema pirellone)
#text(style:"italic", size:11pt, [Si comincia a comporre il presente documento contestualmente e collaborativamente all'URL:\
#h(6mm) `https://etherpad.wikimedia.org/p/DiscreteOptimization2024-03-12`\
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])

== Meeting 2024-03-12

```
Problemi, modelli e linguaggi
il modello di Gauss (sistemi ineari in n equazioni ed n incognite è sia in NP che in coNP)



Models can be more or less general.
A model A is more general than a model B if we can reduce from problem B to problem A.

Example:
 Recall the sume_and_difference problem/model?
     
 INPUT: The sum of the ages of my children is S
        Their difference is D
 TASK:  What are the ages of my children?
 
 We can see it as the problem of finding two (integer?) numbers x and y such that
    x + y = S
    x - y = D
    
and see it as a special case of a linear system on n real variables and n linear equations.

The LINEAR SYSTEMS PROBLEM/MODEL:
    
 INPUT: an nx1 matrix real variables x, a square matrix A and an nx1 matrix b.
 TASK:  Does the system Ax=b have a solution, how many, compute one.
 
The reduction is:
    consider vector of unknowns x=(age1,age2)', vector of knowns b = (S,D)', and matrix A = ( (1,1), (1,-1) ).
    Since det(A) = -2 != 0 we know that for ever vector b the system Ax=b has a unique solution. We use the Gauss-solver to compute this unique solution and return it.
    In case we are interested in the problems where the ages should be integers (or else we consider the puzzle without solution) then before returning the solution of the Gauss-solver we check that it is integer, if it is not we conclude that no solution exists. (Similarly if we do not accept negative values for the ages. Also here we know that our final NO answer will be correct because Ax=b has a unique solution.)
    
The LINEAR SYSTEMS PROBLEM/MODEL in DECISION FORM:
    
 INPUT: an nx1 matrix x of real variables, a square nxn matrix A of real numbers, and an nx1 matrix b of real numbers.
 TASK:  Say whether Ax=b has a solution or no one.
    
This decision problem is in NP: i.e., whenever the answer is yes, then there is a polynomial size certificate that can be checked in polynomial time.
   The solution.
   
Example: 
    x1 + x2      = 3   
         x2 + x3 = 5
    x1      + x3 = 4
    
 Does it have a solution?
 Yes, and the certificate is (x1,x2,x3) = (1,2,3), which is what we call a solution.
 If I am given a solution it is very easy form me to check it out.   
        
    (1) + (2)      = 3 ok
          (2) +(3) = 5 ok
    (1)       +(3) = 4 ok
    You convinced me that this instance of the problem has indeed a solution, is a YES instance.
    
   The only danger that would prevent me to conclude that this problem is in NP is if there was a linear system family where the number of bits needed to describe its solution grows exponentially (or just faster than any polynomial) in terms of x and the number of bits required for encoding A and b.
   
NOTE: Assume det(A) != 0, then we can produce a solution of Ax=b which has polynomial size by resorting on Kramer's rule:
       for every i=1,...,n:
           x_i = | A(i,b) | / |A|  is a solution.
       where |M| denotes the determinat of the square matrix M
       and A(i,b) is the matrix we obtain from A by replacing its i-th column with the vector b.         
 
 It then suffices to show that |M| is a number with at most a polynomial number of bits in the number of bits required to encode M. To show this we can use the Laplace expansion formula for the determinat of a matrix.
 
 
Inversions of a permutation:
    (2, 3, 1):
         inversions:
               (2,1) is an inversion
               (3,1) is an inversion
               
Observation: When we excange place of two elements in the permutation, the parity of the number of inversions necessarily changes.             

positive_val( |M| ) <= (n!) max( positive_val(A[i][j])^n ) 
   
  log_2 ( positive_val( |M| ) <= (n!) max( positive_val(A[i][j])^n )  )
   <= log_2(n!)  + log_2( max( positive_val(A[i][j])^n )
   <= log_2(n^n)  + n * log_2( max( positive_val(A[i][j]) )
   <= n ( log_2(n) + log_2( max( positive_val(A[i][j]) )

Consider this problem:
    INPUT: an mxn matrix of zeros and one.
    TASK: find a way to turn it off completely.
          Allowed moves:
            -choose a row and flip all of its entries (0 becomes 1 and 1 becomes 0)
            -choose a column and flip all of its entries (0 becomes 1 and 1 becomes 0)
```

== mazes

The problem of finding the solution to a mate is naturally placed in NP.

But it is also in coNP, and, actually, the language is the same.

