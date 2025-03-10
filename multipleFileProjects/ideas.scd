/*

/////////
NOTES
/////////

- TODOs:
- grace note
- slur (different notes on same pluck)
- something like Pxrand, but only certain values can't be repeated; other values can be repeated

*/



(

s.waitForBoot({

	// Load synths
	(PathName(thisProcess.nowExecutingPath).parentPath ++ "scripts/loadSynths.scd").load;



	s.sync;



	t = TempoClock(90/60);

	~basePattern = Pbind(
		\instrument, \cheapPiano1,

		\root, -1,
		\octave, 6,
		\scale, Scale.new([0, 1, 4, 5, 7, 8, 10])
	);

	~pbind = Pbindf(
		~basePattern,

		\degree, Pseq((0..14).mirror.drop(-1), inf),
		\dur, 0.16
	);

	~pbind.play;

	// TODO: Generalize the melodic patterns in all these Pbinds

});

)