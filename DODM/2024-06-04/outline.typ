= Meeting 2024-06-04:
#text(style:"italic", size:11pt, [Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])

== matchings and node covers in non-bipartite graphs

Computing maximum matchings remains in P (the good characterization by Tutte 1947, the Tutte–Berge min-max formula 1958, the blossom algorithm by Edmonds 1965).
Meanwhile, computing min node covers goes NP-hard.

We described the local replacement reduction from SAT to 3-SAT (Karp, 1972), and and a classical gadget reduction from 3-SAT to min node cover in decision form. We also gave a reduction by restriction from hitting set to node cover and a reduction from hitting set to set cover by just reconsidering the problem from another perspective.

We defined what is a $c$-approximation algorithm, underlining in what it differs from an heuristic and spotlighting on how it allows to optain lower bounds for minimization problems like min node cover or upper bounds for maximization problems. We also reminded has such bounds play an important role within branch-and-bound algorithms. 

