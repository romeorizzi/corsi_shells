= 2024-04-03 Ricerca Operativa

#text(style:"italic", size:11pt, [
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/87547655553`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=58ba7ced-73bd-4fd0-b01f-b12d0106957d`\
])

== Incontro 2024-04-03

+ linguaggio di si per il problema=modello di Gauss (una soluzione)

+ linguaggio di no per il problema di Gauss (una combinazione lineare dei vincoli che sia un'equazione ovviamente insoddisfacibile, ossia del tipo $0 = b$, con $b eq.not 0$)

+ linguaggi di si e di no per problemi di ottimizzazione offrono certificati a supporto di lower-bounds e di upper-bounds (esempio: i certificati dell'algoritmo di Euclide esteso)

+ il problema=modello della programmazione lineare (PL)

+ la forma standard di massimizzazione della PL

+ suo linguaggio di SI (abbiamo disturbato la ragola di Kramer per convincerci che quando il sistema è feasible allora esiste sempre una soluzione il cui encodings richieda un numero di bits al più polinomiale nel numero di bits letti in input)

+ il metodo geometrico per risolvere un problema di PL in due sole variabili

+ comprensione fisico/geometrica di cosa succede all'ottimo (riesco a creare l'antigravità (ossia l'opposto del gradiente della funzione obiettivo) come combinazione conica delle reazioni vincolari dei vincoli attivi (gli opposti dei loro gradienti).

+ formulazione di una buona congettura: le combinazioni coniche di vincoli forniscono il linguaggio di NO

+ passaggio alla forma canonica per rendere vera eguaglianza tra tutti i vincoli (nella forma di massimizzazione standard i vincoli tecnici sono di $<=$ mentre quelli di non negatività sono dei $>=$. Inoltre in quelli tecnici compaiono più variabili. Invece nella forma canonica tutte le diseguaglianze sono espresse in termini di una singola variabile.)

Ora che abbiamo una buona congettura possiamo andare a dimostrarla/ottenere un algoritmo. Lascia che il problema ci guidi, don't let it be misunderstood.
