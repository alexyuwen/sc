
// Here is a sound example to show how you might use Streams to generate musical material.

(
    SynthDef(\help_SPE1, { arg freq;
        var out;
        out = RLPF.ar(
            LFSaw.ar( freq, mul: EnvGen.kr( Env.perc(releaseTime: 12.91), levelScale: 0.3, doneAction: Done.freeSelf )),
            LFNoise1.kr(1, 36, 110).midicps,
            0.1
        );
        4.do({ out = AllpassN.ar(out, 0.05, [0.05.rand, 0.05.rand], 4) });
        Out.ar( 0, out );
    }).send(s);
)

(
// streams as a sequence of pitches
    var stream, dur;
    dur = 1/8;
    stream = Routine.new({
        loop({
            if (0.5.coin, {
                // run of fifths:
                24.yield;
                31.yield;
                36.yield;
                43.yield;
                48.yield;
                55.yield;
            });
            rrand(2,5).do({
                // varying arpeggio
                60.yield;
                #[63,65].choose.yield;
                67.yield;
                #[70,72,74].choose.yield;
            });
            // random high melody
            rrand(3,9).do({ #[74,75,77,79,81].choose.yield });
        });
    });
    Routine({
        loop({
            Synth(\help_SPE1, [ \freq, stream.next.midicps ] );
            dur.wait; // synonym for yield, used by .play to schedule next occurence
        })
    }).play;
)





































// Here is a variation of the previous example that uses a Pattern to create two instances of the random melody stream.

(
    s = Server.local;
    SynthDef(\help_SPE2, { arg i_out=0, sustain=1, freq;
        var out;
        out = RLPF.ar(
            LFSaw.ar( freq ),
            LFNoise1.kr(1, 36, 110).midicps,
            0.1
        ) * EnvGen.kr( Env.perc, levelScale: 0.3,
            timeScale: sustain, doneAction: Done.freeSelf );
        4.do({ out = AllpassN.ar(out, 0.05, [0.05.rand, 0.05.rand], 4) });
        Out.ar( i_out, out );
    }).send(s);
)
(
// streams as a sequence of pitches
    var pattern, streams, dur, durDiff;
    dur = 1/7;
    durDiff = 3;
    pattern = Prout.new({
        loop({
            if (0.5.coin, {
                #[ 24,31,36,43,48,55 ].do({ arg fifth; fifth.yield });
            });
            rrand(2,5).do({
                // varying arpeggio
                60.yield;
                #[63,65].choose.yield;
                67.yield;
                #[70,72,74].choose.yield;
            });
            // random high melody
            rrand(3,9).do({ #[74,75,77,79,81].choose.yield });
        });
    });
    streams = [
        (pattern - Pfunc.new({ #[12, 7, 7, 0].choose })).midicps.asStream,
        pattern.midicps.asStream
    ];
    Routine({
        loop({
            Synth( \help_SPE2, [ \freq, streams.at(0).next, \sustain, dur * durDiff ] );
            durDiff.do({
                Synth( \help_SPE2, [ \freq, streams.at(1).next, \sustain, dur ] );
                dur.wait;
            });
        })
    }).play
)











































(
var a, b;
a = Pseq.new(#[1, 2], { rrand(1, 3) });    // repeat 1,2, or 3 times
b = a.asStream;
7.do({ b.next.postln; });
)






































// Here is an example that uses a Pattern to create a rhythmic mridangam solo. The values in the pattern specify the amplitudes of impulses fed to the Decay2 generator.

(
SynthDef( \help_SPE3_Mridangam, { |out, t_amp|
    var sound;

    sound = Resonz.ar(
        WhiteNoise.ar(70) * Decay2.kr( t_amp, 0.002, 0.1 ),
        60.midicps,
        0.02,
        4
    ).distort * 0.4;

    Out.ar(out, sound);
    DetectSilence.ar(sound, doneAction: Done.freeSelf);
}).add;

SynthDef( \help_SPE3_Drone, { |out|
    var sound;
    sound = LPF.ar(
        Saw.ar([60, 60.04].midicps)
        +
        Saw.ar([67, 67.04].midicps),
        108.midicps,
        0.007
    );
    Out.ar(out, sound);
}).add;
)

(
// percussion solo in 10/8

var stream, pat, amp;

pat = Pseq([
    Pseq(#[0.0], 10),

    // intro
    Pseq(#[0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], 2),
    Pseq(#[0.9, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, 0.2, 0.0, 0.0], 2),
    Pseq(#[0.9, 0.0, 0.0, 0.2, 0.0, 0.2, 0.0, 0.2, 0.0, 0.0], 2),
    Pseq(#[0.9, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, 0.2, 0.0, 0.2], 2),

    // solo
    Prand([
        Pseq(#[0.9, 0.0, 0.0, 0.7, 0.0, 0.2, 0.0, 0.7, 0.0, 0.0]),
        Pseq(#[0.9, 0.2, 0.0, 0.7, 0.0, 0.2, 0.0, 0.7, 0.0, 0.0]),
        Pseq(#[0.9, 0.0, 0.0, 0.7, 0.0, 0.2, 0.0, 0.7, 0.0, 0.2]),
        Pseq(#[0.9, 0.0, 0.0, 0.7, 0.2, 0.2, 0.0, 0.7, 0.0, 0.0]),
        Pseq(#[0.9, 0.0, 0.0, 0.7, 0.0, 0.2, 0.2, 0.7, 0.2, 0.0]),
        Pseq(#[0.9, 0.2, 0.2, 0.7, 0.2, 0.2, 0.2, 0.7, 0.2, 0.2]),
        Pseq(#[0.9, 0.2, 0.2, 0.7, 0.2, 0.2, 0.2, 0.7, 0.0, 0.0]),
        Pseq(#[0.9, 0.0, 0.0, 0.7, 0.2, 0.2, 0.2, 0.7, 0.0, 0.0]),
        Pseq(#[0.9, 0.0, 0.4, 0.0, 0.4, 0.0, 0.4, 0.0, 0.4, 0.0]),
        Pseq(#[0.9, 0.0, 0.0, 0.4, 0.0, 0.0, 0.4, 0.2, 0.4, 0.2]),
        Pseq(#[0.9, 0.0, 0.2, 0.7, 0.0, 0.2, 0.0, 0.7, 0.0, 0.0]),
        Pseq(#[0.9, 0.0, 0.0, 0.7, 0.0, 0.0, 0.0, 0.7, 0.0, 0.0]),
        Pseq(#[0.9, 0.7, 0.7, 0.0, 0.0, 0.2, 0.2, 0.2, 0.0, 0.0]),
        Pseq(#[0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
    ], 30),

    // tehai : 7 beat motif 3 times sharing 1st beat with next 7x3
    // and again the third time:
    //   123456712345671234567                   123456712345671234567
    //                       123456712345671234567
    //   !                   !                   !                   !
    //   1234567890123456789012345678901234567890123456789012345678901
    Pseq(#[2.0, 0.0, 0.2, 0.5, 0.0, 0.2, 0.9,
        1.5, 0.0, 0.2, 0.5, 0.0, 0.2, 0.9,
        1.5, 0.0, 0.2, 0.5, 0.0, 0.2], 3),
    Pseq(#[5], 1),    // sam

    Pseq(#[0.0], inf)
]);

stream = pat.asStream;

Task({
    Synth(\help_SPE3_Drone);
    loop({
        if( ( amp = stream.next ) > 0,
            { Synth(\help_SPE3_Mridangam, [ \t_amp, amp ]) }
        );
        (1/8).wait;
    })
}).play
)


















































(
var pattern, stream;
pattern =
    Pseq([
        Pbind( \abc, Pseq([1, 2, 3])),
        Pbind( \def, Pseq([4, 5, 6])),
        Pbind( \xyz, Pseq([7, 8, 9]))
    ]);
stream = pattern.asStream;
10.do({ stream.next(Event.new).postln; });
)

(
var pattern, stream;
pattern =
    Prand([
        Pbind( \abc, Pseq([1, 2, 3])),
        Pbind( \def, Pseq([4, 5, 6])),
        Pbind( \xyz, Pseq([7, 8, 9]))
    ], 3);
stream = pattern.asStream;
10.do({ stream.next(Event.new).postln; });
)







































Pbind().play;



Pbind( \dur, 0.25 ).play;



(
Pbind(
    \dur, 0.125,
    \legato, 0.2,
    \midinote, Pseq(#[60, 62, 64, 65, 67, 69, 71, 72], inf)
).play;
)



(
Pbind(
    \dur, 0.25,
    \detune, -222,
    \freq, Pseq(#[300, 400, 500, 700, 900], inf)
).play
)
















































(
// a simple scale degree sequence
Pbind(
        // -7 is 8ve below, -3 is a 4th below,
        // 0 is root, 2 is 3rd above, 4 is 5th above, 7 is 8ve above.
    \degree, Pseq([ Pshuf(#[-7,-3,0,2,4,7], 4), Pseq([0,1,2,3,4,5,6,7]) ], inf),
    \dur, 0.15
).play
)


(
// change the octave
Pbind(
    \dur, 0.15,
    \octave, 4,
    \degree, Pseq([ Pshuf(#[-7,-3,0,2,4,7], 4), Pseq([0,1,2,3,4,5,6,7]) ], inf)
).play
)


(
// change the scale
Pbind(
    \dur, 0.15,
    \scale, [0, 2, 3, 5, 7, 8, 10],
    \degree, Pseq([ Pshuf(#[-7,-3,0,2,4,7], 4), Pseq([0,1,2,3,4,5,6,7]) ], inf)
).play
)


(
// modal transposition
var notes;
notes = Pseq([ Pshuf(#[-7,-3,0,2,4,7], 4), Pseq([0,1,2,3,4,5,6,7]) ], 1);
Pseq([
    Pbind(
        \dur, 0.15,
        \mtranspose, 0,
        \degree, notes
    ),
    Pbind(
        \dur, 0.15,
        \mtranspose, 1,
        \degree, notes
    ),
    Pbind(
        \dur, 0.15,
        \mtranspose, 2,
        \degree, notes
    )
], inf).play
)


(
// chromatic transposition
var notes;
notes = Pseq([ Pshuf(#[-7,-3,0,2,4,7], 4), Pseq([0,1,2,3,4,5,6,7]) ], 1);
Pseq([
    Pbind(
        \dur, 0.15,
        \ctranspose, 0,
        \degree, notes
    ),
    Pbind(
        \dur, 0.15,
        \ctranspose, 3,
        \degree, notes
    ),
    Pbind(
        \dur, 0.15,
        \ctranspose, -3,
        \degree, notes
    )
], inf).play
)


(
// frequency detuning
var notes;
notes = Pseq([ Pshuf(#[-7,-3,0,2,4,7], 4), Pseq([0,1,2,3,4,5,6,7]) ], 1);
Pseq([
    Pbind(
        \dur, 0.15,
        \detune, 0,
        \degree, notes
    ),
    Pbind(
        \dur, 0.15,
        \detune, 20,
        \degree, notes
    ),
    Pbind(
        \dur, 0.15,
        \detune, 40,
        \degree, notes
    )
], inf).play
)


(
// chords. If an Array of pitches is returned by a Stream for pitch, then a chord
// will be played.
Pbind(
    \dur, 0.15,
    \degree, Pseq([
        Pshuf(#[-7,-3,0,2,4,7], 4)+[0,4],
        Pseq( [0,1,2,3,4,5,6,7] )+[0,2]
    ], inf)
).play
)


(
// composing in non 12 equal temperaments. 72 tone equal temp.
Pbind(
    \stepsPerOctave, 72,
    \note, Pseq([
            // 1/1, 7/6, 3/2, 7/4, 9/8
        Pseq([ [0,16,42,58,84], Pseq([ 0, 16, 42, 58, 72, 84 ], 2), [0,16,42,58,84] ], 1),
            // 1/1, 6/5, 3/2, 9/5, 9/8
        Pseq([ [0,19,42,61,84], Pseq([ 0, 19, 42, 61, 72, 84 ], 2), [0,19,42,61,84] ], 1),
            // 1/1, 5/4, 3/2, 15/8, 9/8
        Pseq([ [0,23,42,65,84], Pseq([ 0, 23, 42, 65, 72, 84 ], 2), [0,23,42,65,84] ], 1),
            // 1/1, 9/7, 3/2, 27/14, 9/8
        Pseq([ [0,26,42,68,84], Pseq([ 0, 26, 42, 68, 72, 84 ], 2), [0,26,42,68,84] ], 1)
        ], inf),
    \dur, Pseq([ 1.2, Pseq([0.15], 12), 1.2], inf)
).play
)













// Duration is expressed in beats and is bound to the 'dur' symbol. The sustain time of a note can be expressed directly in beats or by using a legato value which is multiplied by the note duration to get the sustain time.

(
// changing duration
Pbind(
    \dur, Pseq([ Pgeom(0.05, 1.1, 24), Pgeom(0.5, 0.909, 24) ], inf),
    \midinote, Pseq(#[60, 58], inf)
).play
)


(
// changing legato value
Pbind(
    \dur, 0.2,
    \legato, Pseq([ Pseries(0.05, 0.05, 40), Pseries(2.05, -0.05, 40) ], inf),
    \midinote, Pseq(#[48, 51, 55, 58, 60, 58, 55, 51], inf)
).play
)
























(
Ppar([
    Pbind(\dur, 0.2, \midinote, Pseq([62, 65, 69, 72], inf)),
    Pbind(\dur, 0.4, \midinote, Pseq([50, 45], inf))
]).play
)


(
// Ppars can be nested
Ppar([
    Pbind(
        \dur, Prand([0.2, 0.4, 0.6], inf),
        \midinote, Prand([72, 74, 76, 77, 79, 81], inf),
        \db, -26,
        \legato, 1.1
    ),
    Pseq([
        Pbind(\dur, 3.2, \freq, Pseq([\rest]) ),
        Prand([
            Ppar([
                Pbind(\dur, 0.2, \pan,  0.5, \midinote, Pseq([60, 64, 67, 64])),
                Pbind(\dur, 0.4, \pan, -0.5, \midinote, Pseq([48, 43]))
            ]),
            Ppar([
                Pbind(\dur, 0.2, \pan,  0.5, \midinote, Pseq([62, 65, 69, 65])),
                Pbind(\dur, 0.4, \pan, -0.5, \midinote, Pseq([50, 45]))
            ]),
            Ppar([
                Pbind(\dur, 0.2, \pan,  0.5, \midinote, Pseq([64, 67, 71, 67])),
                Pbind(\dur, 0.4, \pan, -0.5, \midinote, Pseq([52, 47]))
            ])
        ], 12)
    ], inf)
], inf).play;
)






























(
SynthDef(\help_SPE7_BerlinB, { arg i_out=0, freq = 80, amp = 0.2, pan=0;
    var out, a, b;
    amp = Decay2.kr(Impulse.kr(0), 0.05, 8, amp);
    out = RLPF.ar(
        LFPulse.ar(freq, 0, SinOsc.kr(0.12,[0,0.5pi],0.48,0.5), amp),
        freq * SinOsc.kr(0.21,0,4,8),
        0.07
    );
    #a, b = out;
    DetectSilence.ar(a, 0.0001, doneAction: Done.freeSelf);
    Out.ar(i_out, Mix.ar(PanAz.ar(4, [a, b], [pan, pan+1])));
}).add;

SynthDef(\help_SPE7_CFString1, { arg i_out, freq = 360, gate = 1, pan, amp=0.1;
    var out, eg, fc, osc, a, b, w;
    fc = LinExp.kr(LFNoise1.kr(Rand(0.25,0.4)), -1,1,500,2000);
    osc = Mix.fill(8, { LFSaw.ar(freq * [Rand(0.99,1.01),Rand(0.99,1.01)], 0, amp) }).distort * 0.2;
    eg = EnvGen.kr(Env.asr(1,1,100), gate, doneAction: Done.freeSelf);
    out = eg * RLPF.ar(osc, fc, 0.1);
    #a, b = out;
    Out.ar(i_out, Mix.ar(PanAz.ar(4, [a, b], [pan, pan+0.3])));
}).add;
)



(
Pbind(
    \instrument, Prand([\help_SPE7_BerlinB, \help_SPE7_CFString1],inf).trace,
    \degree, Pseq([0,1,2,4,6,3,4,8],inf),
    \dur, 0.8,
    \octave, 3,
    \amp, 0.03
).play;
)