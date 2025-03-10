/*

/////////
NOTES
/////////

-

*/



(

s.waitForBoot({

	// Load synths
	(PathName(thisProcess.nowExecutingPath).parentPath ++ "scripts/loadSynths.scd").load;



	s.sync;



	t = TempoClock(120/60);



	~pbind = Pbind(
		\instrument, \clapElectro,

		\stretch, Pseries(1, 0.1).fold(0.2, 1),
		\amp, 1.0
	);

	~pbind.play(t);

});

)