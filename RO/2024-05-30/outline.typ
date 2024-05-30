=  Incontro 2024-05-30 Ricerca Operativa

#text(style:"italic", size:11pt, [
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/87547655553`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=58ba7ced-73bd-4fd0-b01f-b12d0106957d`\
])

== Massimo Flusso Minimo Taglio

Abbiamo costruito assieme un algoritmo combinatorico (l'algoritmo di Bellman-Ford) che restituisce sia un massimo flusso che un minimo taglio, di pari valore, dimostrando quindi il buon max-flow min-cut theorem.

Lo schema di massima dell'algoritmo era:

```
1. parti da un qualsiasi flusso x ammissibile
2. finchè x non è massimo:
       modifica x in modo da aumentarne il valore
```

Questo approccio (assai generale) ci ha condotti a considerare il seguente problema:

INPUT: una rete (G,s,t) e un flusso x ammissibile per (G,s,t)
TASK: decidere se x sia ottimo o meno

Abbiamo scoperto come riformulare questa questione come una questione di reachability di t da s in una rete ausiliaria, che abbiamo chiamato "rete dei possibili scostamenti da x"

Tale questione viene risolta dalla BFS, che produce certificato di SI nella forma di un cammino oppure di NO nella forma di un taglio che separa s da t.

Il cammino può essere rielaborato come una guida operativa alla produzionedi un flusso di valore maggiore. Il taglio, che verrà prodotto all'ultima chiamata della procedura BFS, potrà essere riletto come certificato di ottimalità del flusso x corrente.


== Riduzione del modello del Max Bipartite Matching al Massimo Flusso Minimo Taglio

Abbiamo anche dedotto il buon teorema di Koenig dal buon max-flow min-cut theorem.

