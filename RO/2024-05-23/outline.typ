=  Incontro 2024-05-23 Ricerca Operativa

#text(style:"italic", size:11pt, [
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/87547655553`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=58ba7ced-73bd-4fd0-b01f-b12d0106957d`\
])

== Equivalenza delle due seguenti formulazioni

Siamo tornati a parlare dell'equivalenza delle seguenti due formulazioni.

Kuratowski [1930]: un grafo è planare se e solo se non contiene nè $K_{3,3}$ nè $K_5$ come topological minor.

Wagner [1931]: un grafo è planare se e solo se non contiene nè $K_{3,3}$ nè $K_5$ come minor.

Graph Minor Theorem: Ogni proprietà di grafi che sia chiusa rispetto a prendere minori ammette al più un numero finito di forbidden minors.

== Max-flow/Min-cut

Abbiamo introdotto il problema.
Definizione di flusso e di flusso ammissibile.

Buona congettura: max val di un flusso ammissibile = min capacity di un_s,t-cut. 
Formulazione del problema in termini di PL.

Il politopo che si ottiene è a vertici interi (già questo offre dimostrazione della buona congettura).

=== verso un algoritmo combinatorico

Un flusso può essere descritto come un set di al più $m$ cammini, ognuno col suo moltiplicatore. I cammini sono flussi elementari.


