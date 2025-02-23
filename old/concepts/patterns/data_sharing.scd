//

(

var text = "SuperCollider is an environment and programming language originally released in 1996 by James McCartney for real-time audio synthesis and algorithmic composition. Since then it has been evolving into a system used and further developed by both scientists and artists working with sound. It is a dynamic programming language providing a framework for acoustic research, algorithmic music, interactive programming and live coding. Originally released under the terms of the GPL-2.0-or-later in 2002, and from version 3.4 under GPL-3.0-or-later, SuperCollider is free and open-source software.";

var degreeFunction = {
	var degree = 0;

	if(
		0.6.coin,
		{ degree = degree + 1 }
	);

	if(
		0.3.coin,
		{ degree = degree + 2; }
	);

	if(
		0.06.coin,
		{ degree = -3 }
	);

	degree;
};

var routineFunc = {
	var wordLengths = text.split(separator: $ ).collect({ |x| x.size; });
	var scaledLengths = wordLengths.collect({ |x| (x / 2).floor; });
	var maxLength = scaledLengths.maxItem;

	["maxLength", maxLength].postln;

	scaledLengths.do({
		arg length;

		var degree;

		[length, maxLength - length + 3].postln;

		(maxLength - length + 3).do({
			degree = (length / 2).floor +  [0, 1].wchoose(weights: [3, 2].normalizeSum);
			degree.yield;
		});
	});
};

~phrases = (
	p1: Pseq([4, 7, 4])
);



s.waitForBoot({

	SynthDef(\src, {
		arg freq = 440, amp = 0.4, gate = 1, releaseTime = 0.4, releaseCurve = -4;

		var env;
		var sig;

		env = EnvGen.ar(
			envelope: Env.perc(releaseTime: releaseTime, curve: releaseCurve),
			gate: gate,
			doneAction: 2
		);

		sig = VarSaw.ar(freq: freq, width: 0.2) * env * amp;

		Out.ar(0, sig ! 2);
	}).add;



	s.sync;


	// TODO: Try boolean data in key

	Pbind(
		\instrument, \src,

		\dur, 0.3,

		\scale, Scale.spanish,

/*		\isSlow, Pseq([
			Pn(false, 10),
			Pn(true, 6)
		], repeats: inf),
		\dur, Pif(
			Pkey(\isSlow),
			0.3,
			0.12
		),*/

		// \degree, Pwrand(list: (0 .. 7), weights: [5, 4, 3, 2, 3, 2, 4, 5].normalizeSum, repeats: inf),

		\degree, Pseq([0, 2, 4, 6, 7], inf),

/*		\degree1, Pxrand(list: [0, 2, 4], repeats: inf),
		\degree, Plazy({
			var degree1 = Pkey(\degree1);

			Pif(
				degree1 |==| 2,
				degree1 + [-9, -5, -2, 0, 2, 4, 6],
				degree1
			);
		}),*/

		\amp, 0.2,
		\releaseTime, 0.1,
		\releaseCurve, -4,

		\sustain, 0.01,
	).play;

});

)