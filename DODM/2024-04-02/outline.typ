= Meeting 2024-04-02: i linguaggi di si e no della Programmazione Lineare (PL)
#text(style:"italic", size:11pt, [Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])


```
The other time we saw:
1. what is a linear program
2. what is a linear program in standard form
   max c'x
      Ax <= b
   and how to bring any LP problem in standard form
3. a NO languange, that is, since we are working with an (optimization/search problem), an (upper bound/certificate for it) on the optimal objective function value)

In particular, for the following example problem:
    max x1 + x2
    3x1 +2x2 <= 5
    2x1 +3x2 <= 5
    x1, x2 >= 0
    
We saw a feasible solution (Yes certificate, lower bound) of value 2:
    x1=1,x2=1
It was easy for King Arthur to check that this solution was feasible and so we have the following lower bound of 2 on the optimal objective function value:
    x1 + x2 = (1)+(1) = 2     

We also saw a way to certificate that 2 was the optimal value.

(1/5) 3x1 + 2x2 <= 5 +
(1/5) 2x1 + 3x2 <= 5
      --------------
      1x1 + 1x2 <= 2 

We already observed that Linear Programming is in NP (easy to certify any possible valid lower-bound). 
good conjecture (any conjecture such that, it it were true, than it would also be easy to certify any possible valid upper-bound):
    it is enough to combine (with suitable multipliers) the constraints that are tight (=satisfied at equality) in the optimal solution.
    
    what does it mean combine:
        choose a multipler for each such constraint and produce the linear combination of them via these multipliers.
        
 (1/5) 3x1 + 2x2 <= 5 +    -->  3x1 + 2x2 <= 5 +
(-1/5) 2x1 + 3x2 <= 5      --> -2x1 - 3x2 >= -5
       --------------            --------------
      1x1 + 1x2 <= 2              ???
        VALID
    
The multipliear should be non-negative

Definition: a conic combination is any linear combination where all multipliers are non-negative.    
    
Now that we have a suitable good conjecture, it might be a suitable  plan to (prove it/obtain an algorithm that finds the optimum and builds the certificates)

Still one thing should disturb us.

Consider the problem:
    max x1 + x2 +x3
        x1          <= 1
             x2     <= 1
                 x3 <= 1
        x1, x2, x3 >= 0         
Lower bounds:
    0 yes-cert: (x1=0,x2=0,x3=0)
    1 yes-cert: (x1=1,x2=0,x3=0)
    3 yes-cert: (x1=1,x2=1,x3=1)

Upper bounds:
  (*1)  x1          <= 1
  (*1)       x2     <= 1
  (*1)           x3 <= 1
--------------------------
        x1 + x2 +x3 <= 3
Great! Our nice good conjecture is still alive!

    max x1 -x2 +x3
        x1          <= 1
             x2     <= 1
                 x3 <= 1
        x1, x2, x3 >= 0         
Lower bounds:
    0 yes-cert: (x1=0,x2=0,x3=0)
    2 yes-cert: (x1=1,x2=0,x3=1)
Upper bounds:
  (*1)  x1          <= 1
  (*1)           x3 <= 1
  (*-1)    x2       >= 0  
       ----------------    
we should use a non-negative constraint as weel, but of course we should give it a non-positive multiplier.
We do not like this asimmetry, this is the standard way to solve it:
    Consider the canonic form of the problem which makes all distances from a constraint a non-negative variable:
    max x1 -x2 +x3
        x1          <= 1   -->   s1 := 1 - x1
             x2     <= 1   -->   s2 := 1 - x2
                 x3 <= 1   -->   s3 := 1 - x2
        x1, x2, x3 >= 0         x1, x2, x3, s1, s2, s3 >= 0
   
Thus, this is a problem in canonic for:
         
    max x1 -x2 +x3
        s1 = 1 - x1
        s2 = 1 - x2
        s3 = 1 - x3
        x1, x2, x3, s1, s2, s3 >= 0
       
Lower bounds:
    2 yes-cert: (x1=1,x2=0,x3=1,s1=0,s2=1,s3=0)
Upper bounds:
  (*-1)  s1          >= 0
  (*-1)           s3 >= 0
  (*-1)      x2      >= 0  
        -s1 -x2   -s3 <= 0   should be true for every feasible solution
        
what does this truth imply for the objective function value?
   objective function value = x1 -x2 +x3 = (1-s1) -x2 +(1-s3) = 2 -s1 -x2 -s3 <= 2 
   
The simplex algorithm:
max 4x1 + x2 + 3x3
     x1 + 4x2 ≤ 1
    3x1 − x2 + x3 ≤ 3
     x1, x2, x3 ≥ 0
     
    max z = 4x1 + x2 + 3x3
    w1 = 1 - x1 - 4x2
    w2 = 3 - 3x1 +  x2 - x3
    x1, x2, x3, w1, w2 ≥ 0

    basic solution x1=0, x2=0, x3=0 (hence w1,w2=1,3) is feasible if all the known terms (the b vector of problem in standard form max {c'x: Ax <= b, x >= 0}) are non negative, hence it certifies that the optimal objective function value is at least 0.    
    
    The tight contraints for this basic solution are x1>=0, x2>=0, x3>=0.
    Can we obtain a certificate of optimality combining these constraints or can we build a new basic feasible solution with better objective function value?
         
    Yes, since x3 appears with coefficient 3 > 0 in the current objective function expression, then we have good reasons to lift it away from its current value of 0. The more we push it, the more we gain.
    However, there will be of course a limit: the only problem is that we loose feasibility. The only way we might loose feasibility is beacause a basic variable gets negative. We stop at the first variable becomeing 0. In this way, not only we expolit till the vary end the direction of improvement that we have found, but we also get a new tight contraints (the non-negative contraint of x3 will not be tight any longer) as needeed to express a NO-certificate.
        
Now we want to produce the next step rewriting, where the non-basic variable are x1,x2,w2 and w1, x3 are the basic one.
The procedure for obtaining this rewriting is called pivoting.

    max z = 4x1 + x2 + 3x3
    w1 = 1 - x1 - 4x2
    w2 = 3 - 3x1 +  x2 - x3
    x1, x2, x3, w1, w2 ≥ 0

```