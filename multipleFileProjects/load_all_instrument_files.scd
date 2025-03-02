/*

/////////
NOTES
/////////

-

*/



(

s.waitForBoot({

	~path = PathName(thisProcess.nowExecutingPath).parentPath;
	// TODO: load all instrument files
	~synthFile = ~path ++ "synths/bass/rubberBand.scd";
	~synthFile.load();



	s.sync;



	t = TempoClock(50/60);



	~basePattern = Pbind(
		\instrument, \rubberBand,

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