/*

/////////
NOTES
/////////

- Pfunc, Prout?

*/



(

s.waitForBoot({

	SynthDef(\src, {
		arg out = 0, freq = 440, amp = 0.1, pan = 0, level = 0.2;

		var env;
		var sig;

		env = EnvGen.kr(
			envelope: Env.perc(
				attackTime: 0.01,
				releaseTime: 0.2,
				level: level,
				curve: -4
			),
			doneAction: 2
		);

		sig = Pulse.ar(freq: freq * [1, 1], width: 0.55, mul: env);

		sig = RLPF.ar(
			in: sig,
			freq: freq,
			rq: 0.1
		);

		sig = Balance2.ar(sig[0], sig[1], pan);

		Out.ar(out, sig * amp);
	}).add;



	s.sync;

	t = TempoClock(60/60);

	~degrees = Pxrand([
		Pseq([0, 2, 2, 1]),
		Pseq([0, -3, 0, -1]),
		Pseq([0, 0, 1, 2])
	],  2);

	~degreesDup = Pxrand([
		Pdup(2, Pseq([0, 2, 2, 1])),
		Pdup(2, Pseq([0, -3, 0, -1])),
		Pdup(2, Pseq([0, 0, 1, 2]))
	], rrand(4, 8)) ++ Pn(\rest, [1, 3].wchoose([2, 1]) * 8);

	Ptpar([

		0,
		Pbind(
			\instrument, \src,

			\amp, Env(
				levels: [0.66, 0.28],
				times: [3],
				curve: -2
			).asStream,

			\dur, 0.2,
		),

		1,
		Pbind(
			\instrument, \src,

			\degree, 4,

			\amp, Env(
				levels: [0.5, 0.15],
				times: [2],
				curve: -0.4
			).asStream,

			\dur, 0.301
		),

		3,
		Pbind(
			\instrument, \src,

			\scale, Scale.harmonicMinor,
			\degree, Pn(~degreesDup),

			\testKey, false,

			\amp, Env(
				levels: [0.5, 0.5],
				times: [2],
				curve: -0.4
			).asStream,

			\dur, 0.2 / 2
		);

	]).play(t);

});

)





























(

p = Plambda(
    Pbind(
        \a, Plet(\z, Pseries(0, 1, inf), Pseries(100, -1, inf)),
        \b, Pget(\z, 0, inf) * 2
    ).trace(key: \eventScope, prefix: "\nscope: ")
).asStream;

)

p.next(());







(

p = Pbind(
    \z, Pseries(0, 1, inf),
    \a, Pseries(100, -1, inf),
    \b, Pkey(\z) * 2
).asStream;

)

p.nextN(5, ()).do(_.postln);


















//Plazy used to produce a sequence of pitches:

(
SynthDef(\help_sinegrain,
    { arg out=0, freq=440, sustain=0.05;
        var env;
        env = EnvGen.kr(Env.perc(0.01, sustain, 0.2), doneAction: Done.freeSelf);
        Out.ar(out, SinOsc.ar(freq, 0, env))
    }).add;
)

(
a = Plazy({
    var x, y;
    x = Array.series(rrand(2, 4), [1, 5].choose, 1);
    x.put(x.size.rand, 8+0.1.rand2);
    Pseq(x,1);
});
x = Pn(a, inf).asStream;

Routine({
    loop({
        Synth(\help_sinegrain, [\freq, (x.next*5+70).midicps]);
        0.13.wait;
    })
}).play;
)


// using event streams

(
a = Plazy({
    var x, y;
    x = Array.series(rrand(2, 4), [1, 5].choose, 1);
    x.put(x.size.rand, 8+0.1.rand2);
    Pbind(
        \instrument, \help_sinegrain,
        \dur, 0.12,
        \degree, Pseq(x, 2)
    )
});

Pn(a, inf).play;
)