=  Incontro 2024-05-15 Ricerca Operativa

#text(style:"italic", size:11pt, [
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/87547655553`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=58ba7ced-73bd-4fd0-b01f-b12d0106957d`\
])

== grafi planari

Def: Dato un grafo $G=(V,E)$, un suo _planar embedding_
è una mappa $m$ che associa ad ogni $e in E$ una curva semplice nel piano:

1. curva semplice significa immagine (ossia codominio) di una funzione continua definita sull'intervallo chiuso $[0,1]$ e a valori nei punti del piano $R^2$

2. per ogni due archi $e$ ed $f$ di $G$, vale che ogni eventuale punto $p$ contenuto sia nell'immagine della curva $m(e)$ che in quella di $m(f)$ sia in realtà punto di estremo sia per entrambe le curve (ossia immagine di $0$ oppure di $1$).

Def: un grafo si dice planare se ammette un planar embedding

Puzzle: il $K_5$ è planare o no?

Puzzle: il $K_{3,3}$ è planare o no?

Capire se un grafo è planare oppure no è un problema di decisione che, per nascita, appartiene alla classe NP (lo yes-certificate è il planar embedding)


Teo: la congettura 4CT è equivalente alla questione:
     ogni grafo planare è $4$-colorabile.

Per dirlo davvero, verifichiamo 2 cose:

1. che il grafo definito da un problema di 4-colorabilità di una mappa è sempre planare

2. che ogni grafo planare è grafo la cui 4-colorabilità rappresenta il problema di 4-colorabilità di una qualche mappa.

Abbiamo poi visto che lo scheletro di un qualsiasi politopo in 3D è un grafo planare.

Abbiamo introdotto il concetto di triangolazione di grafo planare, come grafo estremale (più difficile da colorare)

