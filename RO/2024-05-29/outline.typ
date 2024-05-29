=  Incontro 2024-05-29 Ricerca Operativa

#text(style:"italic", size:11pt, [
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/87547655553`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=58ba7ced-73bd-4fd0-b01f-b12d0106957d`\
])

== Massimo Flusso Minimo Taglio

E' un problema combinatorico di nascita in quanto, dove $phi: E arrow RR$ fosse la soluzione desiderata, ossia quello che chiamiamo un flusso ammissibile, allora esisterebbe sembre una soluzione ottima intera.


Fact: data una qualsiasi istanza ($G$,$s$,$t$,$c$) con le capacità $c$ intere ($c: E arrow NN$) esiste sempre una soluzione ottima intera.

proof:
   Di fatto esiste sempre una soluzione se e solo se $c >= 0$ (basti considerare $phi=0$).
   La formulazione come problema di PL data la volta scorsa evidenzia che lo spazio delle soluzioni è un poliedro (compatto).
   Poichè tale poliedro è contenuto nella box $0 <= x <= c$ allora è un politopo (compatto), quindi esiste almeno una soluzione ottima (la regione ammissibile non è illimitata ed è compatta).
   Sia $phi$ una qualsiasi soluzione ottima. Se è intera abbiamo vinto.
   Si prenda pertanto contezza dell'insieme degli archi $E' subset.eq E$ dove $phi$ è frazionaria (= non intera). Si noti che in nessun nodo $v$ può essere incidente un solo arco di $E'$.
   Quindi $E'$ contiene un ciclo $C$.
   Gli archi di $C$ possono essere partizionati come $C^+$ oppure $C^-$ a seconda del verso di percorrenza. Sia $epsilon^+ = min_(e in C^+) c_e - phi_e$
   e $epsilon^- = min_(e in C^+) phi_e$.
   Avremo che $epsilon := min(epsilon^-,epsilon^+) > 0$
   poichè $phi_e$ è frazionario per ogni $e in C subset E'$.
   Sia $phi':E arrow RR$ definito da:
   
   1. $phi'_e := phi_e$ se $e in.not C$
   2. $phi'_e := phi_e + epsilon$ se $e in C^+$
   3. $phi'_e := phi_e - epsilon$ se $e in C^-$

   è ancora un flusso, dello stesso valore di $phi$, e con meno archi su cui è frazionario che non $phi$.
QED


Dimostrazione esistenziale che massimo flusso = minimo taglio

Se $c$ è un intero, allora il minimo valore di taglio è intero.
Se $c_e=0$ per un qualche arco $e$, allora si applichi induzione su $G without e$.
Se esiste un arco $e$ che non appartiene ad alsun taglio minimo, si usi induzione su  ($G$,$s$,$t$,$c'$) dove $c'=c$ eccetto che $c'_e = c_e - 1$.
Se esiste un arco $e=(s,t)$, si usi induzione su  $G without e$ (sia il max-flow val che la min-cut capacity shiftano precisamente di $c_e$).
Se esiste un arco $e=(v,s)$ oppure $e=(t,v)$, si usi induzione su $G without e$ (quì sia il max-flow val che la min-cut capacity nemmeno cambiano).
Se esiste un arco $u,v$ con $u eq.not s$ e $v eq.not t$ che appartiene ad un min capacity $s,t$-cut $delta^+(S)$, allora $s,u in S$ e $v,t in.not S$.
By induction on the graph $G_S$ obtained by conceptually collapsing all nodes in $S$ into a single node $s'$, there exists a flow $phi^S$ saturating the minimum capacity $s',t$-cut $delta^+(s')$.
Similarly, in the graph  $G_macron(S)$ obtained by conceptually collapsing all nodes in $macron(S) := V without S$ into a single node $t'$, there exists a flow $phi^(macron(S))$ saturating the minimum capacity $s,t'$-cut $delta^-(t')$.
Consider the flow $phi$ definito da:
   
   1. $phi_e := phi^(macron(S))_e$ se $e$ è un arco di $G_macron(S)$ non contenuto nel taglio $delta^+(S)=delta^-(t')$ 
   2. $phi_e := phi^(S)_e$ se $e$ è un arco di $G_(S)$ non contenuto nel taglio $delta^+(S)=delta^+(s')$ 
   3. $phi'_e := phi^(macron(S))_e = phi^(S)_e$ se $e in delta^+(S)$ ossia se $e$ è un arco sia di $G_(macron(S))$ che  di $G_(S)$.

Si noti che $phi$ è un flusso di valore pari alla capacità del taglio $delta^+(S)$ che esso satura.

Si assuma pertanto che ogni arco sia contenuto in un $s,t$-taglio di capacità minima, ma non esistano archi $(u,v)$ appartenenti ad $s,t$-tagli di capacità minima aventi sia $u eq.not s$ che $v eq.not t$.
Questo implica che per ogni arco $(u,v)$ deve valere $u = s$ oppure $v = t$. A questo punto è facilissimo concludere.
QED

