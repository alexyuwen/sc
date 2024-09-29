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



	Pbind(
		\instrument, \src,
		// \type, Pseq([\note, \rest], inf),

		\dur, 0.15,

		\scale, Scale.spanish,

		// \degree, 0,

		/*

		Single Patterns

		*/

		// \degree, Pseq(list: (0..14) ++ (13..1), repeats: 2, offset: 7),

		// \degree, Prand(list: (0..7), repeats: 10),
		// \degree, Pxrand(list: (-3..4), repeats: 10),
		// \degree, Pshuf(list: (-3..4), repeats: inf),
		// \degree, Pwrand(list: (-3..4) ++ [11, 18, 25] ++ [7, 14, 21], weights: (8.dup(8) ++ 2.dup(3) ++ 1.dup(3)).normalizeSum, repeats: inf),

		// \degree, Pseries(start: 0, step: Prand([-1, 1], inf), length: 10),

		// \freq, Pgeom(start: 200, grow: 1.01, length: inf),

		// \degree, Pwhite(lo: -3, hi: 4, length: inf),
		// \freq, Pexprand(lo: 200, hi: 800, length: inf),
		// \degree, Pbrown(lo: -3, hi: 4, step: 2, length: inf),

		// \freq, Pgbrown(lo: 200, hi: 400, step: 0.14, length: inf),
		// \freq, Pbeta(lo: 200, hi: 400, prob1: 0.3, prob2: 0.6, length: inf),
		// \freq, Pcauchy(mean: 1000, spread: 10, length: inf),
		// \degree, Pgauss(mean: 0, dev: 5, length: inf).round(4),
		// \degree, Phprand(lo: -4, hi: 0).round,
		// \degree, Plprand(lo: 0, hi: 4, length: inf),
		// \degree, Pmeanrand(lo: 0, hi: 28, length: inf).round(7),
		// \degree, Ppoisson(mean: 2, length: inf) - 3,
		// \degree, Pprob(distribution: [0, 100, -20], lo: -4, hi: 3, length: inf).round,

		// \degree, Pfunc(nextFunc: degreeFunction),

		// \degree, Pfuncn(func: degreeFunction, repeats: 10),

		// \degree, Prout(routineFunc: routineFunc),

		// \degree, Pser(list: (0..7), repeats: 13, offset: 0),
		// \degree, Pslide(list: (-3..4).scramble, repeats: inf, len: 2, step: 1, start: 0, wrapAtEnd: true),
		// \degree, Pwalk(list: [0, 2, 4, 6, 7, 5, 3, 1], stepPattern: -1, directionPattern: -1, startPos: 4), // The behavior of directionPattern (1 vs -1) seems inconsistent depending on whether or not stepPattern is 1 or -1
		// \degree, Place(list: [[0, -1], 1], repeats: inf, offset: 0),

/*		\degree, Ppatlace(
			list: [
				Pxrand(list: [-1, 0, 1], repeats: inf),
				Pwrand(list: [-3, -2, 2, 3, 4], weights: [1, 2, 2, 1, 1].normalizeSum, repeats: inf)
			],
			repeats: inf,
			offset: 0
		),*/

/*		\degree, Ptuple(
			list: [
				Pseq(list: [4, 1, 4, 0].dupEach(2) - 7, repeats: inf),
				Pshuf(list: [0, 0, -1, -1, -2], repeats: inf)
			],
			repeats: inf
		),*/



		/*

		List Pattern Embedding

		*/

		\degree, Pnsym(
			pattern: Pseq(list: #[p1], repeats: inf),
			dict: ~phrases
		),



		/*

		Math on Patterns

		*/

		// \degree, Pseq(Prand, Prand),


		\amp, 0.2,
		\releaseTime, 0.12,
		\releaseCurve, -4
	).play;

});

)