#!/usr/bin/python
from sys import stderr, setrecursionlimit
from functools import lru_cache
setrecursionlimit(10**5)

MOD = 10**9 + 7

indent_cols = 1
def indent():
    global indent_cols
    indent_cols += 2
def deindent():
    global indent_cols
    indent_cols -= 2
def print_stderr(*args,**argv):
    argv["file"] = stderr
    print("|"* indent_cols, *args,**argv)


@lru_cache(maxsize=None)
def num_valid_confs_special_case(L, R, num_ast):
    """ritorna il numero di sequenze di  (num_ast + 2)  numeri naturali valide che iniziano con L e terminano con R.
       Una sequenze s è valida se |s_i - s_(i+1)| <= 1 per i=0,...,num_ast. 
    """
    print_stderr(f"called num_valid_confs_special_case({L=}, {R=}, {num_ast=})", file=stderr)
    indent()
    if L < 0 or R < 0:
        print_stderr(f"0 <- num_valid_confs_special_case({L=}, {R=}, {num_ast=}) since L < 0 or R < 0", file=stderr)
        deindent()
        return 0 
    if L - R > num_ast + 1  or  R - L > num_ast + 1:
        print_stderr(f"0 <- num_valid_confs_special_case({L=}, {R=}, {num_ast=}) since L - R > num_ast + 1  or  R - L > num_ast + 1", file=stderr)
        deindent()
        return 0
    if num_ast == 0:
        print_stderr(f"1 <- num_valid_confs_special_case({L=}, {R=}, {num_ast=}) since num_ast == 0", file=stderr)
        deindent()
        return 1
    if L == 0:
        risp = ( num_valid_confs_special_case(L, R, num_ast - 1) + num_valid_confs_special_case(L + 1, R, num_ast - 1) ) % MOD
    else:
        risp = ( num_valid_confs_special_case(L - 1, R, num_ast - 1) + num_valid_confs_special_case(L, R, num_ast - 1) + num_valid_confs_special_case(L + 1, R, num_ast - 1) ) % MOD
    print_stderr(f"{risp=} <- num_valid_confs_special_case({L=}, {R=}, {num_ast=})", file=stderr)
    deindent()
    return risp
    

def num_valid_confs(mask):
    """quante sono le configurazioni valide compatibili con una data mask.
       Le configurazioni valide sono sequenze di numeri naturali dove:
          1. s_0 = 0 = s_(n-1)
          2. |s_i - s_(i+1)| <= 1. 
    """
    print_stderr(f"called num_valid_confs({mask=})", file=stderr)
    indent()
    n = len(mask)
    if  mask[0] > 0  or  mask[n-1] > 0:
        print_stderr(f"0 <- called num_valid_confs({mask=}) since mask[0] > 0  or  mask[n-1] > 0", file=stderr)
        deindent()
        return 0
    mask[0] = mask[n-1] = 0
    
    risp = 1
    pos_first_maybe_ast = 1
    while pos_first_maybe_ast < n - 1:
        while mask[pos_first_maybe_ast] != -1:
            if mask[pos_first_maybe_ast] < mask[pos_first_maybe_ast - 1] - 1:
                print_stderr(f"0 <- called num_valid_confs({mask=}) since  mask[pos_first_maybe_ast] < mask[pos_first_maybe_ast - 1] - 1", file=stderr)
                deindent()
                return 0
            if mask[pos_first_maybe_ast] > mask[pos_first_maybe_ast - 1] + 1:
                print_stderr(f"0 <- called num_valid_confs({mask=}) since  mask[pos_first_maybe_ast] > mask[pos_first_maybe_ast - 1] + 1", file=stderr)
                deindent()
                return 0
            pos_first_maybe_ast += 1
        pos_first_ast = pos_first_maybe_ast
        count_ast = 1
        pos_curr = pos_first_ast + 1
        while mask[pos_curr] == -1:
            count_ast += 1
            pos_curr += 1
        risp = (risp * num_valid_confs_special_case(mask[pos_first_ast - 1], mask[pos_curr], count_ast)) % MOD
        pos_first_maybe_ast = pos_curr + 1
    print_stderr(f"{risp=} <- called num_valid_confs({mask=})", file=stderr)
    deindent()
    return risp



mask = list(map(int, input().strip().split()))    
print(num_valid_confs(mask))
