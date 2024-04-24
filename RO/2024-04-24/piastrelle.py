#!/usr/bin/python

MAXN = 10000

def f(n):
    assert n >= 0
    if n <= 1:
        return 1
    return f(n-1) + f(n-2)

#MEMO_risp = [None] * (MAXN+1)
MEMO_risp = [None] * 2
MEMO_risp[0] = MEMO_risp[1] = 1 
def f_memo(n):
    assert n >= 0
    if MEMO_risp[n] is None:
        MEMO_risp[n] = f_memo(n-1) + f_memo(n-2)        
    return MEMO_risp[n]


#for n in range(MAXN+1):
#    print(f"{n=}, {f_memo(n)=}")

for n in range(2, MAXN+1):
    MEMO_risp[n%2] = MEMO_risp[(n-1)%2] + MEMO_risp[(n-2)%2]

print(f"n=MAXN, {MEMO_risp[MAXN%2]=}")

    
