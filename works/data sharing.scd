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



	~degrees = p{
		var p = Pfsm([
			[0],
			Pseq([0, 1]),
			[1],
			Pseq([2, 3, 4, 5, 6, 7]),
			[0]
		], inf).asStream;

		inf.do({
			p.yield;
		});
	};

	~durs = p{
		var dur = 0.25;

		inf.do({
			dur.yield;
		});
	};

	~durs0 = Pseq([0.09], 1);
	~durs1 = Pseq([0.18], 1);

	Pbind(
		\instrument, \src2,

		\state, Pseq([1, 1, 1, 0, 0, 0, 0, 0], inf),

		\root, -1,
		\scale, Scale.harmonicMajor,

		\degree, ~degrees,
		\includeDouble, 0,

		\amp, 0.5,

		\dur, Pfunc {
			arg event;

			if (event[\state] == 0) {
				~durs0.asStream.next;
			} {
				~durs1.asStream.next;
			}
		}
	).trace.play(t);

});

)