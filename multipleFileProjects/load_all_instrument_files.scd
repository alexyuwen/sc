/*

/////////
NOTES
/////////

-

*/



(

s.waitForBoot({

	// Load synths
	PathName.new(PathName(thisProcess.nowExecutingPath).parentPath ++ "synths").filesDo({
		arg file;

		if(
			file.extension == "scd"
		){
			("Loading " ++ file.fullPath).postln;
			file.fullPath.load;
		}

	});



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