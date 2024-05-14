=  Incontro 2024-05-09 Ricerca Operativa

#text(style:"italic", size:11pt, [
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/87547655553`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=58ba7ced-73bd-4fd0-b01f-b12d0106957d`\
])

== modelliamo con la PLI e poi subito con la PLI il problema del massimo matching in grafo bipartito

Un _matching_ in un grafo $G=(V,E)$ è un sottoinsieme $M subset E$ dei suoi archi tale che non ci siano due archi in $M$ incidenti allo stesso nodo.

Un grafo si dice bipartito se è $2$-colorabile, cioè i suoi nodi possono essere colorati utilizzando due colori in modo tale che, per ogni arco $e= u v in E$ i suoi due nodi terminali abbiano colori diversi.

Input: un grafo non-diretto e bipartito

Obiettivo: calcolare un matching di massima cardinalità

Abbiamo lavorato su un grafo di 6 nodi: A,B,C,a,b,c
e 5 archi:

- $A a$
- $A b$
- $A c$ 
- $B a$
- $C a$

Abbiamo formulato il problema in termini di programmazione lineare intera e siamo passati al rilassamento continuo.
Nel rilassamento continuo abbiamo applicato la teoria della dualità.
Il teorema della dualità debole già ci fornisce un bound combinatorico.
Ispirati dal teorema della dualità forte, ci interroghiamo in merito all'interezza dei politopi coinvolti.

Definizione: una matrice è detta totalmente unimodulare se ogni sua sottomatrice quadrata ha determinante in ${0, 1, -1}$. In particolare, ogni sua entry è in ${0, 1, -1}$. 

Abbiamo osservato come le matrici totalmente unimodulari conducano a politopi/poliedri interi.

Abbiamo dimostrato che le matrici di adiacenza nodi-arco di grafi bipartiti sono totalmente unimodulari.