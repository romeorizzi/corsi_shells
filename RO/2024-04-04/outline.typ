= 2024-04-04 Ricerca Operativa

#text(style:"italic", size:11pt, [
Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/87547655553`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=58ba7ced-73bd-4fd0-b01f-b12d0106957d`\
])


Con riferimento ad un problema di PL in forma standard, la volta scorsa abbiamo osservato come il naturale linguaggio certificante dei lower-bounds (si, mangia l'avocado) fosse compatto (abbiamo disturbato la regola di Kramer) ma abbiamo anche intuito quale potesse essere il linguaggio certificante degli upper-bounds (no, non mangiare la mela):
  a placcarmi nel vertice ottimo saranno quei soli vincoli su cui poggio (vincoli tight, soddisfatti ad uguaglianza) dove riesco a creare l'antigravità (ossia l'opposto del gradiente della funzione obiettivo) come combinazione conica delle reazioni vincolari dei vincoli attivi (gli opposti dei loro gradienti). Ossia dove i gradiente delle funzione obiettivo è nel cono dei gradienti dei vincoli attivi. Combinando i vincoli attivi proprio attraverso i moltiplicatori di tale combinazione conica ottengo un pavimento virtuale perfettamente orizzontale.

Questo insight ci ha permesso di formulare la seguente:

+ buona congettura: le combinazioni coniche di vincoli forniscono il linguaggio di NO per la PL.

+ considerazioni sul valore dell'uguaglianza ci hanno poi suggerito di passare alla forma canonica (nella forma di massimizzazione standard i vincoli tecnici sono di $<=$ mentre quelli di non negatività sono dei $>=$. E cosa ancor più importante, in quelli tecnici compaiono più variabili. Invece nella forma canonica tutte le diseguaglianze sono tutte di $>=$ e sono tutte espresse in termini di una singola variabile.

Ora che abbiamo una buona congettura possiamo andare a dimostrarla/ottenere un algoritmo. Lascia che il problema ci guidi, don't let it be misunderstood.

Partiamo dalla FORMA STANDARD:

$
"max" & 5 &x_1 + 4 &x_2 + 3 &x_3 &  \
      & 2 &x_1 + 3 &x_2 +   &x_3 &≤& 5 \
      & 4 &x_1 + 1 &x_2 + 2 &x_3 &≤& 11 \
      & 3 &x_1 + 4 &x_2 + 2 &x_3 &≤& 8 \
$
$
      x_1, x_2, x_3 ≥ 0
$

Portiamolo nella FORMA CANONICA (dove tutte le disuguaglianze sono vincoli di non-negatività) che si ottiene introducendo le variabili di slack dei vincoli tecnici della forma standard:

$
"max" z &=&  0& +5 &x_1& + 4 &x_2& + 3 &x_3& \
    s_1 &=&  5& -2 &x_1& - 3 &x_2& -   &x_3& \
    s_2 &=& 11& -4 &x_1& - 1 &x_2& - 2 &x_3& \
    s_3 &=&  8& -3 &x_1& - 4 &x_2& - 2 &x_3& \
$
$
      x_1, x_2, x_3 ≥ 0
$

Dato che il vettore dei termini noti è non-negativo (b >= 0) la soluzione associata a questo dizionario (si ottiene mettendo a zero tutte le variabili colonna, dette variabili non di base, e leggendo i valori delle variabili riga, dette variabili di base, di conseguenza).

scrittura/dizionario che esplica il valore della funzione obiettivo e la distanza dalle pareti per ogni punto $vec(x)$ nello $RR^3$ delle decisioni (nota che $vec(x)$ può esso stesso essere visto come il vettore delle distanze dai vincoli di non-negatività):
$
"max" z &=&  0& +5 &x_1& + 4 &x_2& + 3 &x_3& \
    s_1 &=&  5& -2 &x_1& - 3 &x_2& -   &x_3& \
    s_2 &=& 11& -4 &x_1& - 1 &x_2& - 2 &x_3& \
    s_3 &=&  8& -3 &x_1& - 4 &x_2& - 2 &x_3& \
$
(dove gli importantissimi vincoli di non-negatività possiamo darli per sottintesi)

\Competenza 1: leggere la soluzione di base associata

$ (x_1 = 0, x_2 = 0, x_3 = 0, s_1 = 5, s_2 = 11, s_3 = 8, z = 0 ) $

\Competenza 2: stabilire se essa è ammissibile

sì, perchè $5 >= 0$, $11 >= 0$, $8 >= 0$  (non negatività delle variabili in base)

\Competenza 3: stabilire se essa è ottima

no, ad esempio perchè la funzione obiettivo contiene coefficienti strettamente positivi (ad esempio l'ultimo).

Raccolto un elemento che mi dice che non è ottima (ad esempio il $3>0$ in terza colonna nella riga che esprime la funzione obiettivo) posso forse tradurlo in un miglioramento della soluzione attuale.

Spingiamo sulla $x_3$ fino a dove non si annulla una prima variabile di base. Se facciamo così non solo mantaniamo l'ammissibilità, ma ci ritroviamo ancora in un vertice, e forse possiamo vederlo come una nuova soluzione di base (ossia una soluzione che è la soluzione di base adssociata ad un qualche dizionario).

Come scrivere tale dizionario (pivot)?
\variabili indipendenti: $x_1, x_2, s_3$
\variabili dipendenti: $s_1, s_2, x_3$

\scrittura/dizionario precedente:
$
"max" z &=&  0& +5 &x_1 + 4 &x_2 + 3 &x_3 \
    s_1 &=&  5& -2 &x_1 - 3 &x_2 -   &x_3 \
    s_2 &=& 11& -4 &x_1 - 1 &x_2 - 2 &x_3 \
    s_3 &=&  8& -3 &x_1 - 4 &x_2 - 2 &x_3 \
$
\come produrre da essa la nuova scrittura:
+ identificare la colonna di pivot e la riga di pivot
+ riscrivere la riga di pivot in modo da esplicitare la sua unica varibile sporca al nuova soluzione in termini della altre variabili (ora tutte pulite):
riga di pivot nel vecchio dizionario: $ s_3 =  8 -3 x_1 - 4 x_2 - 2 x_3 $
(portiamo a sinistra la variabile $x_3$ che si è sporcata (ci siamo allontanati dalla parete della sua non-negatività) e portiamo a destra la variabile $s_3$ che intendiamo pulire):

$   2 x_3 = 8 - 3 x_1 - 4 x_2 - s_3 $   quasi ci siamo ad avere una scrittura esplicita per $x_2$ ...

posso dividere l'intera equazione di pivot per $2$ dato che $2 not eq 0$, e così ottengo la mia prima riga (l'ex-riga-di-pivot) per il nuovo dizionario:

$    x_3 = 4 - 3/2 x_1 - 2 x_2 - 1/2 s_3 $

ora utilizziamo questa prima riga del nuovo dizionario per ottenere tutte le altre:
dato che nella riga di pivot invertita abbiamo espresso la nuova variabile di base $x_3$ tutta in termini di variabili pulite (facce del politipo alle quali ci teniamo aderenti) allora posso sostituire la $x_3$ che si è sporcata in termini di variabili tutte pulite nella altre equazioni:

$
"max" z =& 12& +1/2 &x_1 -2 &x_2 - 3/2 &x_3 \
    s_1 =&  1& -1/2 &x_1 -1 &x_2 + 1/2 &x_3 \
    s_2 =&  3&   -1 &x_1 +3 &x_2 +   1 &x_3 \
    s_3 =&  4& -3/2 &x_1 -2 &x_2 - 1/2 &x_3 \
$


no, ad esempio perchè la funzione obiettivo contiene coefficienti strettamente positivi (ad esempio l'ultimo).

\Competenza 1: leggere la soluzione di base associata

$ (x_1 = 0, x_2 = 0, x_3 = 4, s_1 = 1, s_2 = 3, s_3 = 0, z = 12 ) $

\Competenza 2: stabilire se essa è ammissibile

sì, perchè $1 >= 0$, $3 >= 0$, $4 >= 0$  (non negatività delle variabili in base)

\Competenza 3: stabilire se essa è ottima

no, perchè la funzione obiettivo contiene coefficienti strettamente positivi (il primo, quello della $x_1$).

