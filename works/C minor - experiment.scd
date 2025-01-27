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

		sig = Pulse.ar(freq: freq, width: 0.55, mul: env);

		sig = RLPF.ar(
			in: sig,
			freq: freq,
			rq: 0.1
		);

		sig2 = Pulse.ar(freq: freq * 2, width: 0.55, mul: env * 0.1);

		sig2 = RLPF.ar(
			in: sig2,
			freq: freq * 2,
			rq: 0.1
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

	~phrases = [
		[0, \rest, 0, 0, -3, \rest, -3, \rest],
		[0, \rest, 2, \rest, 2, \rest, 1, \rest],
		0.dup(8)
	];

	~degrees = p{
		var p = Pfsm([
			#[0],
			Pseq(~phrases[0]), // state 0
			[1],
			Pseq(~phrases[1]), // state 1
			[0]
		], inf).asStream;

		inf.do({
			p.yield;
		});
	};

	Ptpar([

		0,
		Pbind(
			\instrument, \src,

			\melodyInfo, ~degrees,

			\root, -1,
			\scale, Scale.todi,

			\degree, ~degrees,
			\includeDouble, 1,

			\amp, 0.5,

			\dur, 0.25,
		)

	]).play(t);

});

)