/*

/////////
NOTES
/////////

-

*/



(

s.waitForBoot({

	SynthDef(\src, {
		arg freq = 440;

		var sig, sigs, env;

		env = EnvGen.kr(
			envelope: Env.perc,
			doneAction: 2
		);

		sigs = [
			SinOsc.ar(freq: freq, mul: 0.2),
			VarSaw.ar(freq: freq / 2, iphase: 0, width: 0, mul: 0.01),
			Pulse.ar(freq: freq, width: 0.5, mul: 0.04);
		];

		sigs = sigs.collect({ |x| x * env; });

		sig = sigs.sum;

		Out.ar([0, 1], sig);

	}).add;



	s.sync;



	r{
		var freqs, durations;
		var n = 5;
		var stretch = 0.2;

		freqs = [0, 4, 1, 3, 2];
		durations = [4, 4, 4, 2, 2];

		freqs = freqs.collect({ |x| Scale.melodicMinor.degreeToFreq(degree: x, rootFreq: 57.midicps, octave: -1); });

		 durations = durations * stretch;

		inf.do({

			n.do({
				arg i;

				var randomNum = rrand(-0.15, 0.15);

				~synth = Synth(\src, [\freq, freqs[i]]);

				(durations[i] + randomNum).yield;

				0.001.yield;
			});

		});

	}.play;

});

)