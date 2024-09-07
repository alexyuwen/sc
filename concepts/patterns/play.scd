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



	e = (
		neumeCount: 0,
		iPrev: -1
	);

	t = TempoClock(60/60);

	~fsm = Pfsm([
		#[0],

		// state 0
		Pdup(2, Pseq([0, 2, 2, 1])),
		#[1, 2],

		// state 1
		Pdup(2, Pseq([0, 0, 1, 2])),
		#[0, 2],

		// state 2
		Pdup(2, Pseq([0, -3, 0, -1])),
		#[3],

		// state 3
		Pseq([0]) ++ Pn(\rest, 7),
		#[0, 1, 2],

		// terminal state
		nil,
		nil
	]);

	Plambda(
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
				\degree, ~fsm,

				\amp, Env(
					levels: [0.5, 0.5],
					times: [2],
					curve: -0.4
				).asStream,

				\dur, 0.2 / 2
			)

		]),

	).play(t);

});

)