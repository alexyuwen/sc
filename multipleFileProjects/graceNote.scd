/*

/////////
NOTES
/////////

-

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

	// TODO: Generalize the melodic patterns in all these Pbinds

	~pbind1 = Pbindf(
		~basePattern,

		\degree, Pn(0, 1),
		\dur, 1
	);

	/*	~pbind2 = Pbindf(
	~basePattern,

	\degree, Plazy({Pseq(5.collect({rrand(0, 7)}), rrand(1, 3))}), // without Plazy, the same Pseq would be repeated
	\dur, 1 / 5
	);*/

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

	// TODO: how to do Pfsm, but with probabilities for next state?
	Pfsm([
		#[0],

		~pbind1,
		{rrand(0, 5)},

		~pbind3,
		{rrand(0, 5)},

		~pbind4,
		{rrand(0, 5)},

		~pbind5,
		{rrand(0, 5)},

		~pbind6,
		{rrand(0, 5)},

		~pbind7,
		{rrand(0, 5)}
	]).play(t);

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


// Pswitch
(
var a, b;
a = Pseq([1, 2, 3], 2);
b = Pseq([65, 76]);
c = Pswitch([a, b, 800], Pseq([2, 2, 0, 1], inf));  // the "which" array specifies all the patterns to be played, in which order
x = c.asStream;
50.do({ x.next.postln; });
)

{rrand(0, 1)}.choose()