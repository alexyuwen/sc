/*

/////////
NOTES
/////////

*/



(

s.waitForBoot({

	SynthDef(\src, {
		arg out = 0, freq = 440, amp = 0.99, pan = 0, level = 0.9;

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



	Ppar([

		Pbind(
			\instrument, \src,
			\type, Pif(Ptime().trace < 1, \rest, \note), // Ptime isn't good enough -- I want this Pbind to start exactly at t = 1.

			\degree, 4,

			\dur, 0.301
		),

		Pbind(
			\instrument, \src,

			\dur, 0.2,
		)

	]).play;

});

)