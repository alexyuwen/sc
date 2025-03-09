/*

/////////
NOTES
/////////

*/



(

s.waitForBoot({

	// Load synths
	(PathName(thisProcess.nowExecutingPath).parentPath ++ "loadSynths.scd").load;



	s.sync;



	t = TempoClock(90/60);

	~basePattern = Pbind(
		\instrument, \pluck,

		\root, -1,
		\octave, 6,
		\scale, Scale.new([0, 1, 4, 5, 7, 8, 10])
	);

	~pbind1 = Pbindf(
		~basePattern,

		\degree, Pn(0, 1),
		\dur, 1
	);

	~pbind3 = Pbindf(
		~basePattern,

		\degree, Pseq([0, 1, -1], 1),
		\dur, 1 / 3
	);

	~pbind4 = Pbindf(
		~basePattern,

		\degree, Pseq([0, -1, -3, -1], 1),
		\dur, 1 / 4
	);

	~pbind5 = Pbindf(
		~basePattern,

		\degree, Pseq([0, -1, 1, -3, -1], 2),
		\dur, 1 / 5
	);

	~pbind6 = Pbindf(
		~basePattern,

		\degree, Pseq([0, -1, 1, -3, -1, -3], 2),
		\dur, 1 / 6
	);

	~pbind7 = Pbindf(
		~basePattern,

		\degree, Pseq([0, -1, 1, -1, 0, -3, -1], 2),
		\dur, 1 / 7
	);

	~pbind8 = Pbindf(
		~basePattern,

		\degree, Pseq([0, -1, 1, -1, 1, -3, -1, -3], 2),
		\dur, 1 / 8
	);

	~pbinds = [~pbind1, ~pbind3, ~pbind4, ~pbind5, ~pbind6, ~pbind7, ~pbind8];
	~indices = Pseq([0]) ++ Pwrand(list: (0..6), weights: (1 ! 7).normalizeSum, repeats: inf);

	// TODO: every time Pwrand ~pbind1 is chosen, it should be repeated once more.  Pdfsm?
	Pswitch(list: ~pbinds, which: ~indices).play(t);

});

)

// Pdfsm
(
p = Pdfsm(
	[
		Pseq( [\foo,\bar], 2 ), // essentially, the deterministic roadmap for the entire sequence of states
		( // state 0
			\foo : [ 1, Pseq([ 0, 1 ], 2 ) ]
		),
		( // state 1
			\bar : [ 0, 3 ]
		)
	],
	0,
	1
).asStream;

20.do({ p.next.postln });
)