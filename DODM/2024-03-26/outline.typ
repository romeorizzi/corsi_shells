= 2024-03-26: problemi di decisione, di ottimizzazione, di search/costruzione + i linguaggi di si e no (dimostrazione della buona congettura per il problema pirellone)
#text(style:"italic", size:11pt, [Si comincia a comporre il presente documento contestualmente e collaborativamente all'URL:\
#h(6mm) `https://etherpad.wikimedia.org/p/DiscreteOptimization2024-03-26`\
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])

== Incontro 2024-03-26
```
Good Conjecture:
    Every matrix is solvable unless it contains one of the 8 forbidden 2x2 matrices (those with an odd number of 1's).
    
What do we mean by submatrix?
Strong conjecture: a 2x2 submatrix of a matrix is obtained by:
    1. removing all rows except two consecutive ones, and    
    2. removing all columns except two consecutive ones.    

Weak conjecture: a 2x2 submatrix of a matrix is obtained by:
    1. removing all rows except just two of them, and    
    2. removing all columns except just two of them.    

Assume we start to belive the conjecture is true.
Then we go all-in about proving it.

We know we must do it by induction.

We could then seek for an algorithm (its efficiency is not important, it is not on our agenda right now) for the following computational problema:
    INPUT: a matrix with no 2x2 bad submatrix
    TASK: compute and return a solution

We could also go for an algorithm for the following computational problema:
    INPUT: a matrix M
    OUPUT: either a 2x2 bad submatrix of M or a solution for M 

We proved the good conjectures providing efficient algorithms:

1. hide the first raw and give the rest to the tiny fairy.

2. if the tiny fairy returns a 2x2 bad sub-matrix then we pipe that out.

3. otherwise, if after the manipulations of the tiny fairy that erased the submatrix we passed here the first is also erased, we pipe out the same manipulations

4. otherwise, if after the manipulations of the tiny fairy that erased the submatrix we passed here the first is all 1's, then we erase it by toggling the first row and pipe out the same manipulations of the fairy plus the toggling of the first row

5. otherwise pick one 0-element and one 1-element of the first row and the corresondin (=same columns) elements in the second row and notice they form a 2x2 bas submatrix M. Return M. 


== 


max f(x)
with x in X

SEARCH FORM: 
    INPUT: X, f
    OUTPUT: an x in X maximizing f

OPTIMIZATION FORM: 
    INPUT: X, f
    OUTPUT: I'm curious, tell me what is the maximum I could achieve in terms of f
    
DECISION FORM: 
    INPUT: X, f, b
    OUTPUT: Yes if the optimum value is at leat b, No otherwise.

Linear programming is the mathematical programming problem where:
    1. x is a vector of variables
    2. f is a linear function
    3. X is described in terms of linear constraints
       (i.e., 3x1 + 2x2 <= 5 or 2x2-x3 >= 7
        Note: strict inequalities are not allowed in order to guarantee the existence of an optimal solution when the problem is feasible and bounded)

max 3x
    x < 2  not allowed

Every linear program can be cast in standard form:    
max x1 + x2                max c'x
    3x1 +2x2 <= 5            Ax <= b
    2x1 +3x2 <= 5            x >= 0
    x1 >= 0, x2 >= 0

What are the elements that make the form standard:    
1. see it as a maximization rather than as a minimzation    
What if my problem was:
    min 2x1            I regard it as:   -max -2x1
        x1 +x2 >= 3           x1 +x2 >= 3
        
In this way I can reduce minimization problems to maximization probems             
2. no constraints are of the form =

What if my problem was:
    max 2x1            I regard it as:
      x1 + x2 = 3       max 2x1
                           x1 + x2 <= 3
                           x1 + x2 >= 3
3. no constraints are of the form >= (we are only allowed <= except for the non-negativity constraints of the variables)

What if my problem was:
    max 2x1            I regard it as:
      x1 + x2 >= 3       max 2x1
                         -x1 - x2 <= -3
And   max 2x1          I regard it as:
      x1 + x2 = 3       max 2x1
                           x1 + x2 <= 3
                           -x1 - x2 <= -3
4. all variables should be subject to non-negativity constraints, i.e, x >= 0.
What if my problem was:
    max 2x1            after considering x'2 := -x2, I regard it as:
      x1 + x2 <= 3       max 2x1
    x1 >= 0, x2 <= 0             x1 - x'2 <= 3
                                 x1 >= 0, x'2 >= 0     
 
What if my problem was:
    max 2x1       
    x1 + x2 <= 3
    x1 >= 0, x2 free in sign                         
    
I introduce x2^+ := max{0; x2}
            x2^- := max{0; -x2}
Not that they:
    1. are both non-negative
    2. together they encode x2 without any loss of information            

after this the problem:
    max 2x1 +3x2       
    x1 + x2 <= 3
    x1 >= 0, x2 free in sign                         
becomes:
    max 2x1 +3x2^+ - 3x2^-       
    x1 + x2^+ - x2^-<= 3
    x1 >= 0, x2^+ >= 0, x2^- >= 0                         
given that x2 =  x2^+ - x2^-        

So, we can assume that the problem is in standard form.
max x1 + x2                max c'x
    3x1 +2x2 <= 5            Ax <= b
    2x1 +3x2 <= 5            x >= 0
    x1 >= 0, x2 >= 0

Yes-language:
Merlin tells King Arthur: you know guy, you can gain at least 2!
King Arthur: really? Whow! But ... I do not believe you. Please, convince me!
Merlin: (x1,x2)=(1,1)
King Arthur homework: 
f = (1) + (1) = 2 (would be nice)
    3(1) +2(1) = 5 <= 5 ok
    2(1) +3(1) = 5 <= 5 ok           x >= 0
    x1 >= 0, x2 >= 0

```