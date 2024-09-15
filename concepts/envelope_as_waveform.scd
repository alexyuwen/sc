(

s.waitForBoot({

	SynthDef(\src, {
		arg freq = 440, amp = 0.2;

		var period = freq.reciprocal;
		var ampEnv;
		var sig;

		ampEnv = EnvGen.kr(
			envelope: Env.perc,
			levelScale: amp ! 2,
			doneAction: 2
		);

		sig = EnvGen.ar(
			envelope: Env(
				levels: [0, -1, 1, -1, 0],
				times: [0, period / 2, period / 2, 0],
				curve: [0, \sine, \sine, 0],
				releaseNode: 3,
				loopNode: 0
			)
		);

		sig = sig * ampEnv;

		Out.ar(0, sig);
	}).add;



	s.sync;

	r{
		inf.do({
			Synth(\src, [\freq, rrand(430, 440)]);
			1.yield;
		})
	}.play;

});

)







(

{EnvGen.ar(
	envelope: Env(
		levels: [0, -1, 1, -1, 0],
		times: [0, 0.002, 0.002, 0],
		curve: \step,
		releaseNode: 3,
		loopNode: 0
	)
)}.plot;

// TODO: Try to "add" envelopes as method of generating arbitrarily complex waveforms.

)