=  Incontro 2024-05-22 Ricerca Operativa

#text(style:"italic", size:11pt, [
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/87547655553`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=58ba7ced-73bd-4fd0-b01f-b12d0106957d`\
])

== Minimum Spanning Tree

Lemma [dei cicli]: Sia $e$ un arco di peso massimo in un qualche ciclo $C$ del grafo pesato in input. Allora esiste un albero ricoprente $T$ di peso minimo che non usa $e$.

Lemma [sempre cicli, self-reinforcement]: Sia $e$ un arco di peso strettamente massimo in un qualche ciclo $C$ del grafo pesato in input. Allora nessun albero ricoprente di peso minimo usa $e$.

Lemmi duali:

Lemma [dei tagli]: Sia $e$ un arco di peso minimo in un qualche taglio $delta(S)$, $S subset V$, del grafo pesato in input. Allora esiste un albero ricoprente $T$ di peso minimo che usa $e$.

Lemma [sempre tagli, self-reinforcement]: Sia $e$ un arco di peso strettamente minimo in un qualche taglio $delta(S)$, $S subset V$, del grafo pesato in input. Allora ogni albero ricoprente di peso minimo usa $e$.

Non solo gli statement ma anche le relative dimostrazioni dualizzano facilmente (merita esperienziarlo) basandosi entrambe sul seguente lemma a ruolo simmetrico:

Lemma: Sia $C$ un qualsiasi ciclo e $delta(S)$, $S subset V$, un qualsiasi taglio. Allora $|C sect delta(S)| equiv_2 0$.

Algoritmo di Kruskal e algoritmo di Prim.

Equivalenza delle due seguenti formulazioni: 

Kuratowski [1930]: un grafo è planare se e solo se non contiene nè $K_{3,3}$ nè $K_5$ come topological minor.

Wagner [1931]: un grafo è planare se e solo se non contiene nè $K_{3,3}$ nè $K_5$ come minor.

Graph Minor Theorem: Ogni proprietà di grafi che sia chiusa rispetto a prendere minori ammette al più un numero finito di forbidden minors.

