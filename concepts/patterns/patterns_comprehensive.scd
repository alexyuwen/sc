//

(

var constrainDegreeToRange = {
	arg x;

	var octave;
	var offset;

	octave = case
	{ x < -3 } { ((x + 3) / 7).floor }
	{ x > 4 } { ((x - 4) / 7).ceil }
	{ true } { 0 };

	offset = -7 * octave;
	offset.postln;

	x + offset;
};

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

		// \degree, Pseries(start: 0, step: Prand([-1, 1], inf), length: inf).collect(function: constrainDegreeToRange),

		// \freq, Pgeom(start: 200, grow: 1.01, length: inf),

		// \degree, Pwhite(lo: -3, hi: 4, length: inf),
		// \freq, Pexprand(lo: 200, hi: 800, length: inf),
		// \degree, Pbrown(lo: -3, hi: 4, step: 2, length: inf),

		// \degree, Pgbrown(),
		// \degree, Pbeta(),
		// \degree, Pcauchy(),
		// \degree, Pgauss(),
		// \degree, Phprand(),
		// \degree, Plprand(),
		// \degree, Pmeanrand(),
		// \degree, Ppoisson(),
		// \degree, Pprob(),

		// \degree, Pfunc(nextFunc: degreeFunction),

		// \degree, Pfuncn(func: degreeFunction, repeats: 10),

		// \degree, Prout(routineFunc: routineFunc),

		// \degree, Pser(list: (0..7), repeats: 13, offset: 0),
		// \degree, Pslide(list: (-3..4).scramble, repeats: inf, len: 2, step: 1, start: 0, wrapAtEnd: true),
		// \degree, Pwalk(list: [0, 2, 4, 6, 7, 5, 3, 1], stepPattern: -1, directionPattern: -1, startPos: 4), // The behavior of directionPattern (1 vs -1) seems inconsistent depending on whether or not stepPattern is 1 or -1
		\degree, Place(),
		// \degree, Ppatlace(),
		// \degree, Ptuple(),



		/*

		Compound Patterns

		*/

		// \degree, Pseq(Prand, Prand),



		\amp, 0.2,
		\releaseTime, 0.12,
		\releaseCurve, -4
	).play;

});

)