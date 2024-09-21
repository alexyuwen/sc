//

(

s.waitForBoot({

	SynthDef(\src, {
		arg freq = 440, amp = 0.4, releaseTime = 0.4, releaseCurve = -4;

		var env;
		var sig;

		env = EnvGen.kr(
			// envelope: Env.perc(releaseTime: releaseTime, curve: releaseCurve),
			envelope: Env.linen(sustainTime: 1000),
			doneAction: 2
		);

		sig = VarSaw.ar(freq: freq, width: MouseY.kr.poll) * env * amp;

		Out.ar(0, sig ! 2);
	}).add;



	s.sync;



	Synth(\src, [\freq, 440, \amp, 0.2, \releaseTime, 0.4, \releaseCurve, -4]);

/*	r{
		inf.do({
			Synth(\src, [\freq, 440, \amp, 0.04, \releaseTime, 0.4, \releaseCurve, -4]);

			1.yield;
		});
	}.play;*/

});

)