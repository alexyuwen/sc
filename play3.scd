//

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
		\instrument, \src
	).play;

});

)