// With Node Tree open, try switching between Pbind and Pmono for short and long \dur values.  When doneAction is 0, both Pmono and Pmonoartic still prevent a synth pile-up, whereas Pbind does not.

(

s.waitForBoot({

	SynthDef(\src, {
		arg freq = 440, amp = 0.4, gate = 1, releaseTime = 0.4, releaseCurve = -4;

		var env;
		var sig;

		env = EnvGen.kr(
			envelope: Env.adsr(releaseTime: releaseTime, curve: releaseCurve),
			gate: gate,
			doneAction: 0
		);

		sig = VarSaw.ar(freq: freq, width: 0.2) * env * amp;

		Out.ar(0, sig ! 2);
	}).add;



	s.sync;



	Pbind(
		\instrument, \src,

		\dur, 0.4,
		\sustain, 0.2,

		\releaseTime, 4,
		\releaseCurve, -4
	).play;

});

)