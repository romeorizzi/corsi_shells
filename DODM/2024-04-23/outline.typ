= Incontro 2024-04-23: introduction to the TAlight platform we will be using both for the homework and for the main project for the course
#text(style:"italic", size:11pt, [Gli incontri avvengono sia in presenza che nella stanza Zoom:\
#h(6mm) `https://univr.zoom.us/j/83514538731`\
E, quando disponibile, la loro registrazione è nel folder:\
#h(6mm) `https://univr.cloud.panopto.eu/Panopto/Pages/Sessions/List.aspx?folderID=c27d5938-629e-48c0-a238-b12a00b86b38`\
])


IMPORTANT NOTICE: the meeting of next week (Tuesday, April 30) will take place on Zoom.

We have the infrastructure both for the homeworks and for the final project.
The platform for these problems will be TALight.
You can get and install rtal (the Rust implementation of the client for TALight) as explained in the file README_rtal.typ.

*Note:* the name of the executable of the client will of course be `rtal.exe` on Windows (substitute `rtal` with `rtal.exe` everywhere in the following).

== First step: get Rust installed on your machine

To install Rust on your machine go to the following link and follow the simple instructions given there:

```bash
https://rustup.rs/
```

The instruction will be the suitable ones for your architecture and operating system, and will be very easy (one step) to follow through.

*Note:* it is important that towards the end of the installation process you opt for having the paths of the compiled crates made available from whichever directory in your machine. (Do a complete installation to enjoy the full convenience of the cargo crate manager system)

== Second step (optional): get `typst` installed on your machine

`typst` is not a strict requirement but it is nice to have.
Actually, you can use it and try it out without actually installing it at its hub in the cloud:

```
   https://typst.app/
```

If you want to install `typst` on your machine, you can clone it from:
```
https://github.com/typst/typst
```

and compile it as a Rust crate (if you did as suggested in Step 1, then you will have typst available from whereever you are).


== Step 3: clone and installa `rtal`

You should clone an `rtal` version with the capability to deal with the GIA credential, hence clone rtal from the GitHub repo:
```
https://github.com/Guilucand/rtal-algo-client
```
For the less experinced of you (assume you could not get the Rust compiler installed) you can actually can find some pre-compiled releases there (good luck).

For the less experinced of you, instead of cloning that report, just download the .zip archive and uncompress it.
Then compile it with cargo as follows:
go in any directory of the cloned or downloaded and decompressed repo and launch the command:

```bash
   cargo install --locked --path .
```

If you have cargo correclty installed (as suggested) then you can now use the `rtal` command wherever you are on your machine.

== Step 4: get to know the `rtal` client

=== Read the file README_rtal.typ.

This file is wiritten in typst. Typst can be regarded as a Markup language with a well defined format.
This means that you can easily read it as a plain text file:
open it with Windows Notepad, or any other text editor, or through a command like `less` or `type`).
Typst is also an attempt to superseed `LaTex`, hence you can compile it with:

```bash
typst README_rtal.typ
```

to get the .pdf file the document was actually intended to be. (To get the typst compiler you already need rust installed).

=== Read this very short document and practice it meanwhile reading.


=== Similarly, read the file `README_synopsis.typ` to have a more enjoyable and interactive experience with `TALight` problems

Also here, read this very short document and practice it meanwhile reading.

= Now, let us do some practice together:

To make sure that `rtal` is correctly installed:

```bash
rtal --version
```

To see that the service for the homeworks DODM2024 is up and running:

```bash
rtal -s wss://ta.di.univr.it/DODM2024 list
```

Right now, the problems available for you to solve are:

```
- BFS
- conio1
- connected_components
- prima_PD_su_linea
```

(but we will be adding further problems during the course)

Assume you want to try out one of these problems:

```bash
rtal -s wss://ta.di.univr.it/DODM2024 get conio1
```
And the file `conio1.tar` will be downoaded in the directory you stand. Decompress this file with:

```bash
tar xvf conio1.tar
```
and you get more than the files you need to work on the problem:

```
conio1/meta.yaml  (<-- to get to know possible services available for the problem) 
conio1/example.in.txt  <-- might be helpful while debugging
conio1/testo.pdf  *** THE DESCRIPTION/EXPLANATION OF THE PROBLEM ***
conio1/example.out.txt  <-- might be helpful while debugging
conio1/README_synopsis.typ  (<-- possibly updated version)
conio1/README_rtal.typ  (<-- possibly updated version)
```
So, for every problem, the main file is `testo.pdf`, that open (and/or prints) like any other .pdf file.

*Important:* Please, if you are not confortable with Italien, and the file `testo.en.pdf` is not yet there, remind us that we have still to provide it as due.


= How to submit your solutions and get points

First thing you have to login to the service through your GIA credentials:

```bash
rtal -s wss://ta.di.univr.it/DODM2024 login
```

This will return you an URL which you open at in any browser and do the accreditation with the Verona University. This will create the needed cookies on your machine and the needed records on our server so that, from now on you can directly submit at your name from that machine.

*IMPORTANT:* if you work in group (we are very happy of that, but max 3), then it is important that:

1. all of the members of the group submit (entering at their own names)

2. in the source that you attach to the submission, possibly at the beginning (in commented lines) place the student codes (in the form VR??????) of each member of the group

3. if the source actually comprises more than one file then put the .tar of them in attachment

== Example of call
```bash
rtal -s wss://ta.di.univr.it/DODM2024 connect conio1 -a source=conio1-sol_gurobi.py -- ~/corsi/Algoritmi/esami-algo-private/esercitazioni/conio1/sol/conio1-sol_gurobi.py
```

*Note 1:* After the `--` goes whatever runs on your local machine.
For example, if you are on a Windows machine where the files ending in `.py` can not be executable files, then you would resort on writing something like:

```bash
rtal -s wss://ta.di.univr.it/DODM2024 connect conio1 -a source=conio1-sol_gurobi.py -- python ~/corsi/Algoritmi/esami-algo-private/esercitazioni/conio1/sol/conio1-sol_gurobi.py
```

*Note 2:* What your program writes on `stderr` does not disturb the interaction with the server and appears on you terminal. THerefore, `stderr` is a very useful channel for print debugging.




 