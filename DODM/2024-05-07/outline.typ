= Meeting 2024-05-07: a diet problem
#text(style:"italic", size:11pt, [Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])

We have proposed a small diet problem with 3 foods (F1,F2,F3) and 2 nutrients (vitamins A and C):

```
      A  B  cost
  F1  2  2  2
  F2  2  1  1
  F3  1  2  1
need  4  6
```

We modeled it as the following LP:

```
   min 2x1 + x2 +x3
       2x1 + 2x2 +  x3 >= 4
       2x1 +  x2 + 2x3 >= 6
   x1, x2, x3 >= 0
```

After modeling it as an LP, we realize it is in standard minimization form.
But the origin is not admissible.
Therefore, to obtain a first basic feasibile solution, we composed the auxiliary problem by introducing a non-negative fixing-all-constraints variable $x_0$

```
   min x0
       2x1 + 2x2 +  x3 + x0 >= 4
       2x1 +  x2 + 2x3 + x0 >= 6
   x0, x1, x2, x3 >= 0
```

And then composed the first dictionary (we also wrote it as a tableau).

```
   min x0
       w1 = -4 + 2x1 + 2x2 +  x3 + x0 >= 4
       w2 = -6 + 2x1 +  x2 + 2x3 + x0 >= 6
   x0, x1, x2, x3, w1, w2 >= 0
```

The basic solution associate to the first dictionary/tableau was still the non-feasible origin, but with one single pivot (x0 entering and w2 exiting) we obtained a dictionary (and a tableau, we introduced the rules on how to pivot on the tableau) whose associated basic solution was feasible.

From here, we leave the passages to you, but this is what we did:

1. we used the LP "rule-of-9" procedure to check that the pivot operation had been performed all right (both on the dictionary and on the tableau).

2. we saw that the solution to the auxiliary problem was not optimal, whence we made a pivot to improve it. We figured out a pivot that was leading to objective function equal to 0. Hence we had care to use x0 as the leaving variable.

3. We obtained a feasible talbeau for the original problem by dropping the column x0 from this tableau.

4. We restored the original objective function. With this we entere dthe second phase of the simplex method.

5. We saw that the basic solution associated to the current tablea, while feasible, was not optimal (twice), hence we made a pivot (twice) which improved (reduced) the objective function value.  

6. After these two pivots the associated basic solution was optimal, and we read it out from the tableu.

7. We showed how the other important numbers in the tableau would lead to a certificate of optimality (being the optimal solution of the dual. Please, read chapter 5 of the book).

8. We discussed the economic interpretation of these dual variables at the optimum.


 