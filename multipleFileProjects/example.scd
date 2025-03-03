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



	t = TempoClock(50/60);



	~basePattern = Pbind(
		\instrument, \steelDrum,

		\root, -1,
		\octave, 6,
		\scale, Scale.harmonicMajor
	);

	~pbind1 = Pbindf(
		~basePattern,

		\degree, Pseq((0..14).mirror.drop(-1), inf),
		\dur, 0.16
	);

	~pbind1.play(t);

});

)