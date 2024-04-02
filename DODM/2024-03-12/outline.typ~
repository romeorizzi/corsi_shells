= 2024-03-19: ancobuone caratterizzazioni (problema pirellone)
#text(style:"italic", size:11pt, [Si comincia a comporre il presente documento contestualmente e collaborativamente all'URL:\
#h(6mm) `https://etherpad.wikimedia.org/p/DiscreteOptimization2024-03-19`\
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])

== Incontro 2024-03-19

```
Pirellone

input.txt
0 1 0 0
1 0 1 1
0 1 0 0

task: turn off (to 0) every entry of the matrix
use any sequence of the following valid moves:
    + choose any row and flip each one of its entries
    + choose any colum and flip each one of its entries

For example, the above instance can be solved as follows:
0 1 0 0                           0 1 0 0
1 0 1 1  -(flip the second row)-> 0 1 0 0 and then flip the second column
0 1 0 0                           0 1 0 0

One thing that theoretical computer science suggests as is to try considering versions of the problem in decision forms.

Here is a good example of such a version:
    input: the same as above
    task: decide whether this specific input can be turned off entirely
    
Our ambition is to put such a problem in P (no way we can solve the original problem in poly-time without putting this smaller version in P). The theory of complexity suggest us to first go for an attempt to place the problem in the wider classes NP and coNP.

Question: is it in NP?
Lemma [the no switch used more than once lemma]: By indempotency of the moves and by commutativity of the moves we kown that whenever a solution exists, then there exists a solution that acts at most once on each single row or column.

Ahh ... the problem is in NP.

What is the next advisable question to address?
Question: is it in coNP?

Good Conjecture 0: every pirellone can be turned off completely.
Counterexample:
    1 1
    1 0  and its 7 sisters
    (any 2x2-matrix with an odd number of ones)
    
Good Conjecture 1: every pirellone can be turned off completely except for the 8 2x2-matrices discussed above.
Counterexample: take any bad 2x2 matrix and immerse it in an arbitrary bigger matrix.
     
Lemma: if a matrix M contains a forbidden 2x2 matrix M' as a sumbatrix than it can not be solved.
proof:
   Assume not. Assume M is solvable. Let R' a subset of the rows of M and C' a subset of the columns of M such that acting on R'+C' turns off M completely. Then flipping on the rows and columns of M' that are in R'+C' would also solve M', which is na absurd. 
QED    

Good Conjecture 2: every pirellone can be turned off completely unless it contains a forbidden 2x2 as a sumbatrix.
```
