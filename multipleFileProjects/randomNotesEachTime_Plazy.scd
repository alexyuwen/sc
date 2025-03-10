/*

/////////
NOTES
/////////

*/



(

s.waitForBoot({

	// Load synths
	(PathName(thisProcess.nowExecutingPath).parentPath ++ "scripts/loadSynths.scd").load;



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

	~pbind2 = Pbindf(
		~basePattern,

		 // without Plazy, the same Pseq would be repeated
		\degree, Plazy({
			Pseq(
				list: 5.collect({ rrand(0, 7) }),
				repeats: rrand(1, 3)
			);
		}),
		\dur, 1 / 5
	);

	Pfsm([
		#[0],

		// state 0
		~pbind1,
		[1],

		// state 1
		~pbind2,
		[0]
	]).play(t);

});

)