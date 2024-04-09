= Incontro 2024-04-09: i linguaggi di si e no della Programmazione Lineare (PL)
#text(style:"italic", size:11pt, [Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])


```
By now we know:
1. what is a linear program (LP)
   max c'x
      A_1 x <= b_1
      A_2 x >= b_2
      A_3 x = b_3
      x in R^n
   
   and we argued that we can always provide a (yes-type) certificate for any valid lower bound on this optimization problem.
   The certificate that LB is a valid lower-bound would be a point x in R^n which is feasible (i.e., x satisfies all the constraints) and such that c'x >= LB.
   
2. what is a linear program in standard form (A_2,A_3 are both empty, but all variables are non-negative)
   max c'x
      Ax <= b
   and observed how to bring any LP in standard form

3. how to build the canonic form starting from the standard form.  
   For example:
    max z=x1 +x2 +x3               max z=x1 +x2 +x3   (as for another expression, we could write it as 3-s1-s2-s3)
        x1          <= 1   -->   s1 := 1 - x1
             x2     <= 1   -->   s2 := 1 - x2
                 x3 <= 1   -->   s3 := 1 - x2
        x1, x2, x3 >= 0    -->   x1, x2, x3, s1, s2, s3 >= 0
Lower bounds:
  val  |  yes-cert
    0  | (x1=0,x2=0,x3=0) feasible and c'x = 0 - 0 + 0 = 0
    1  | (x1=1,x2=0,x3=0) feasible and c'x = 1
    3  | (x1=1,x2=1,x3=1) feasible and c'x = 3

Upper bounds:

If, among the many possible rewritings of z in terms of an n-size subset of the m+n variables we indeed choose z=3-s1-s2-s3,
then we can argue as follows to prove an upper bound UB=3 (hence, UB=3=LB, and we hold optimality for sure):

Upper bounds: z = 3-s1-s2-s3, but s1>=0, s2>=0 and s3>=0. Hence, z <= 3.

Here, the reason why we choose the look at the world from the point of view of s1,s2,s3 is because the constraints 
        x1          <= 1
             x2     <= 1
                 x3 <= 1

are all three tight at the optimum solution x=(1,1,1), which meant that s1,s2,s3=0 and we do not want to move away from that point.

Good Conjecture: this always works out.

As often the case with good conjectures, it will be like a self-fullfilling phorphecy that auto-realizes and, in the process, delivers an algorithm for solving the problem.

Here are how things work out (we do it together, and both discover and practice with the simplex algorithm):

max 4x1 + x2 + 3x3                    ? what is this guy?
     x1 + 4x2 ≤ 1                       well, it is a mathematical programming problem because if follws the template:
    3x1 − x2 + x3 ≤ 3                          max f(x) with x in X
     x1, x2, x3 ≥ 0                   ? can we be a little more specific ? Yes, it is an LP!
                                      ? can we be a little more specific ? Yes, it is an LP in standard form!
                                      ? can we be a little more specific ? Yes, it is an LP in standard form with feasible origin! (i.e., x=0 is feasible).
				      Note: an LP in standard form is with feasible origin iff b >= 0
				      
    max z =  4x1 + x2 + 3x3
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

The pivot equation is:
    w2 = 3 - 3x1 +  x2 - x3

It has only one dirty (i.e., non-zero) variable non only before the intended pivoting but also after it (after we move to the next feasible vertex of the polyhedron of the feasible solutions).

We need to rewrite it so that only the clean variables are on the right.

       ___ (dirty)
     /
    x3 = 3 - 3x1 +  x2 - w2  (it defines the now dirty variable x3 only in terms of clean variables)

Now, the techinque for rewriting the others is substitution:
                         ___ (dirty)
                        /
    max z = 4x1 + x2 + 3x3 = 4x1 + x2 + 3(3 -3x1 +  x2 -w2)
          = 9 +[4 +3(-3)]x1 +[1 +3(1)]x2 +[0 +3(-1)]w2
	  = 9 -5x1 +4x2 -3w2
    w1 = 1 - x1 - 4x2 = 1 - x1 -4x2 this is already clean by itself
    w2 = 3 - 3x1 +  x2 - x3

So, the new dictionary is:
    max z = 9 -5x1 +4x2 -3w2
       w1 = 1 - x1 -4x2
       x3 = 3 -3x1 + x2 - w2

What is the basic solution associated to this dictionary?
  non-basic variables = x1, x2, w2
  basic variables = w1, x3
  (x1,x2,x3,w1,w2,z)=(0,0,3,1,0,9)

are we at the optimum?
no, because the coefficient of x2 in the objective function is +4>0.

entering variable: x2
pivot row:
w1 = 1 - x1 -4x2   (the leaving variable is w1)

x2 = 1/4 - 1/4x1 -1/4w1  (inverted pivoting row)


So, the new dictionary is:
    max z = 9 -5x1 +4(1/4 - 1/4x1 -1/4w1) -3w2 = 10 -6x1 -w1 -3w2
       x2 = 1/4 - 1/4x1 -1/4w1
       x3 = 3 -3x1 + (1/4 - 1/4x1 -1/4w1) - w2 = 13/4 -13/4x1 -1/4w1 -w2

That is:

    max z =   10   -6 x1    -w1  -3w2
       x2 =  1/4 - 1/4x1 -1/4w1
       x3 = 13/4 -13/4x1 -1/4w1   -w2



What is the basic solution associated to this dictionary?
  non-basic variables = x1, w1, w2
  basic variables = x2, x3
  (x1,x2,x3,w1,w2,z)=(0,1/4,13/4,0,0,10)

are we at the optimum?
yes, because no coefficient it the new expression of the objective function is positive.

Let's build an explicit certificate of optimality (in terms of the original writing)

Use just the coefficient in the last objective function expression (the reduced costs):

-6 for x1
-1 for w1
-3 for w2

and use them as follows:

max 4x1 + x2 + 3x3
     x1 + 4x2     ≤ 1 (1)
    3x1 − x2 + x3 ≤ 3 (3)
___________________________
   10x1 +1x2 + 3x3 ≤ 10

z = 4x1 + x2 + 3x3 <= (since  x1, x2, x3 ≥ 0) <= 10x1 +1x2 + 3x3  ≤ 10

or, you could use also the non-negativity of x1 (with multiplier -6)

      x1 + 4x2     ≤ 1  (* 1)
     3x1 − x2 + x3 ≤ 3  (* 3)
     x1            >= 0 (* -6)
___________________________
 z= 4x1 +1x2 + 3x3 ≤ 10


Another example:
max 5x1 + 4x2 + 3x3
    2x1 + 3x2 + x3 ≤ 5
    4x1 + x2 + 2x3 ≤ 11
    3x1 + 4x2 + 2x3 ≤ 8
    x1, x2, x3 ≥ 0


```