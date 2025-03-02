/*

/////////
NOTES
/////////

-

*/



(

s.waitForBoot({

	SynthDef(\src, {
		arg out = 0, freq = 440, amp = 0.1, pan = 0, level = 0.2, includeDouble = 1;

		var env;
		var sig;
		var sig2;
		var bothSigs;

		env = EnvGen.kr(
			envelope: Env.perc(
				attackTime: 0.01,
				releaseTime: 0.2,
				level: level,
				curve: -4
			),
			doneAction: 2
		);

		sig = Pulse.ar(freq: freq, width: 0.5, mul: env);

		sig = RLPF.ar(
			in: sig,
			freq: freq,
			rq: 0.2
		);

		sig2 = Pulse.ar(freq: freq * 2, width: 0.5, mul: env * 0.1);

		sig2 = RLPF.ar(
			in: sig2,
			freq: freq * 2,
			rq: 0.2
		);

		bothSigs = Balance2.ar(sig, sig2, pan);

		sig = Select.ar(
			includeDouble,
			[
				sig ! 2,
				bothSigs
			]
		);

		Out.ar(out, sig * amp);
	}).add;

	SynthDef(\src2, {
		arg out = 0, freq = 440, amp = 0.1, pan = 0, level = 0.2, includeDouble = 1;

		var env;
		var sig;
		var sig2;
		var bothSigs;

		env = EnvGen.kr(
			envelope: Env.perc(
				attackTime: 0.01,
				releaseTime: 0.2,
				level: level,
				curve: -4
			),
			doneAction: 2
		);

		sig = Pulse.ar(freq: freq, width: 0.5, mul: env);

		sig = RLPF.ar(
			in: sig,
			freq: freq,
			rq: 0.2
		);

		sig2 = Pulse.ar(freq: freq * 2, width: 0.5, mul: env * 0.1);

		sig2 = RLPF.ar(
			in: sig2,
			freq: freq * 2,
			rq: 0.2
		);

		bothSigs = Balance2.ar(sig, sig2, pan);

		sig = Select.ar(
			includeDouble,
			[
				sig ! 2,
				bothSigs
			]
		);

		Out.ar(out, sig * amp);
	}).add;



	s.sync;



	t = TempoClock(50/60);



	Pbind(
		\instrument, \src2,

		\root, -1,
		\scale, Scale.harmonicMajor,
		\degree, Pseq([0, 2], inf),
		\includeDouble, 0,

		\amp, 0.5,

		\dur, Pn(pattern: Pseries(start: 0.1, step: 0.1, length: {rrand(3, 6)})), // Enclosing rrand in curly braces creates a function, which defers evaluation until the stream that plays the Pbind needs the value
	).play(t);

});

)