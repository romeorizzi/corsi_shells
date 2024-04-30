= Incontro 2024-04-30: introduction to dynamic programming
#text(style:"italic", size:11pt, [Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])

My main plan for today is to offer and introduction to a problem solving technique called dynamic programming

=== problem Triangle

given in input a triangle of prizes (natural numbers to specify their value) our aim is to find a path descending from the top vertex and collecting a maximum sum in prizes.

Example:
    
```
input.txt
5
3
7 2
1 1 1
2 1 1 8
2 1 2 3 4
```    
To solve this problem (which asks one single question) we introduce a whole family of related questions on sub-instances (sub-triangles) of the given instance (triangle).

One convenient way to specify a sub-triangle is by pointing to its top vertex.
For every sub-triangle we ask waht would be the optimal value when limiting our attention only to that sub-triangle.
In this way, we have a question posed and answer to produce for each element of the given triangle. And the answers to these questions could be linked in such a way that they fall one after the other.

=== problem Field with Mines

We did this one only on the whiteboard.

The problem was: how many different paths between the opposite cells in a rectangular grid where some of the cells are forbidden?

=== a few variants of the Knapsack problem

I have a multi-set of numbers:  3 5 5 7 8, target = 14
 question 1: can you choose a sub-set of this multi-set so that the sum is precisely 14?
 question 2: assume your lorry can not carry more than 14 Kilos, what is the maximum amount of gold you can rob away from the caveau? 
 
Though these problems are NO-hard, still we have pseudo-polynomial algorithms for solving them that are usually good enough in practice.
These practical algorithms are based on dynamic programming.

The family of problems that we pose our-selves are:
    
    for every i = 0, 1, 2, ..., n  (where n is the number of objects x1, x2, ..., xn in the multiset)
       for every hypothetical capacity of the lorry b = 0, 1, ..., B (= 14)
           pose yourself precisely the original question but assuming a lorry of capacity b and to have at your disposal only the objects x1, x2, ..., xi.
           
x1 = 3, x2 = 5, x3 = 5, x4 = 7, x5 = 8;  Xi = {x1, ..., xi}  (so, X0 means no objects available)
Decision version:
```
     b 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 
X0     y  n  n  n  n  n  n  n  n  n  n  n  n  n  n 
X1     y  n  n  y  n  n  n  n  n  n  n  n  n  n  n <-- 3
X2     y  n  n  y  n  y  n  n  y  n  n  n  n  n  n <-- 5
X3     y  n  n  y  n  y  n  n  y  n  y  n  n  y  n <-- 5
X4     y  n  n  y  n  y  n  y  y  n  y  n  y  y  n
X5     y  n  n  y  n  y  n  y  y  n  y  y  y  y  n
       ^  
```
You have a family of objects and every object has both a weigth and a value.
You are also given a capacity of your knapsack, and want to pick up the best subset of objects (that one that maximizes the total value) without exceeding the capacity of the knapsack.


=== Longest Common Subsequence (LCS)

Given a string s=052.88.3456  we know what is a:
    
- prefix (like 052, or 05 or 0)
- suffix (like 456)
- substring or interval (any prefix of any suffix like 2883)  
- subsequence := throw away some of the elements of the given reference sequence
  (like  5845)
```  
  how to obtain 5845 from s=052883456? 
                             ^ ^  ^^ 
```
A couple of competences: given s = CGTTCGATAATCGTGTA, how to find out whether
  - TGTATTA is a substring of s?
  - TGTATTA is a subsequece of s?
                             
The first question is clearly in P because we only need to guess the starting position.
As for the second question, we have an easy greedy algorithm:

```
Can we read TGTATTA
                  ^
out from CGTTCGATAATCGTGTA,
           *  * ** *  *  * 
```

But now a more difficult problem:
    given two sequences:
```   
s = CGTTCGATAATCGTGTA
t = CTGACCTAGTCTGATC
```
find a common subsequence which is the longest possible.
      
```python
def lcs(i,j):
    """return le maximum length of a string which is a subsequence both of the suffix s[i:] and t[j:]"""
    if problem (i,j) has not yet been answered:
        if i >= len(s) or j >= len(t):
           answer_to[(i,j)] = 0 
           return answer_to[(i,j)]
    if s[i] == t[j]:
        answer_to[(i,j)] = 1 + lcs(i+1,j+1)
        return  answer_to[(i,j)]
    answer_to[(i,j)] = max( lcs(i+1,j), lcs(i,j+1)) 
    return  answer_to[(i,j)] 
```

 Notice that the number of different questions is at most n^2.
 Therefore, this becomes a polynomial (O(n^2)) algorithm if we add memoization.
 Memoization means that we keep a table of all questions in the family that have already been answered (with the answer) 
     
 

 