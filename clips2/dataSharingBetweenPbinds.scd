(

t = TempoClock(30/60);

~bass = Pbind(
    \degree, Pwhite(0, 7, inf),
    \octave, 3,    // down 2 octaves
    \legato, 1,
    \amp, 0.2
).collect({ |event|
    ~lastBassEvent = event;
}).play(t);

~chords = Pbind(
    \topNote, Pseries(7, Prand(#[-2, -1, 1, 2], inf), inf).fold(2, 14),
    \bassTriadNotes, Pfunc { ~lastBassEvent[\degree] } + #[0, 2, 4],
        // merge triad into topnote
        // raises triad notes to the highest octave lower than top note
        // div: is integer division, so x div: 7 * 7 means the next lower multiple of 7
    \merge, (Pkey(\topNote) - Pkey(\bassTriadNotes)) div: 7 * 7 + Pkey(\bassTriadNotes),
        // add topNote to the array if not already there
    \degree, Pfunc { |ev|
        if(ev[\merge].detect({ |item| item == ev[\topNote] }).isNil) {
            ev[\merge] ++ ev[\topNote]
        } {
            ev[\merge]
        }
    },
    \amp, 0.05
).play(t);
)