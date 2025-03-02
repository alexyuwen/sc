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



	~basePattern = Pbind(
		\instrument, \steelDrum,

		\root, -1,
		\octave, 6,
		\scale, Scale.harmonicMajor
	);

	~pbind1 = Pbindf(
		~basePattern,

		\degree, Pn(Pseq([0]), 2),
		\dur, 0.25
	);

	~pbind2 = Pbindf(
		~basePattern,

		\degree, Pseq([4], 4),
		\dur, 0.13
	);

	Pfsm([
		#[0],

		~pbind1,
		#[1],

		~pbind2,
		#[0]
	]).play(t);

});

)