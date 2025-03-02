// TODO: Synth limit exceeded at \dur = 0.0001.  Improve synth logic so that 10,000 synths per second aren't needed.

(

s.waitForBoot({

	SynthDef(\src, {
		arg freq = 440, amp = 0.4, releaseTime = 0.4, releaseCurve = -4;

		var env;
		var sig;

		env = EnvGen.kr(
			envelope: Env.perc(releaseTime: releaseTime, curve: releaseCurve),
			doneAction: 2
		);

		sig = VarSaw.ar(freq: freq, width: 0.2) * env * amp;

		Out.ar(0, sig ! 2);
	}).add;



	s.sync;



	Pbind(
		\instrument, \src,

		\dur, 0.001,

		\scale, Scale.spanish,

		\degree, Pwrand(list: (-3..4) ++ [11, 18, 25] ++ [7, 14, 21], weights: (8.dup(8) ++ 2.dup(3) ++ 1.dup(3)).normalizeSum, repeats: inf),

		\amp, 0.2,
		\releaseTime, 0.12,
		\releaseCurve, -4
	).play;

});

)