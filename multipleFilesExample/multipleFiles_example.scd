/*

/////////
NOTES
/////////

-

*/



(

s.waitForBoot({

	~path = PathName(thisProcess.nowExecutingPath).parentPath;
	~steelDrumFile = ~path ++ "synths/steelDrum.scd";
	~steelDrumFile.load();

	~library_func.();



	s.sync;



	t = TempoClock(50/60);



	~pbind1 = Pbind(
		\instrument, \src,

		\root, -1,
		\scale, Scale.harmonicMajor,
		\degree, Pn(Pseq([0]), 2),
		\includeDouble, 0,

		\amp, 0.5,

		\dur, 0.25
	);

	~pbind2 = Pbind(
		\instrument, \src,

		\root, -1,
		\scale, Scale.harmonicMajor,
		\degree, Pseq([4], 4),
		\includeDouble, 0,

		\amp, 0.5,

		\dur, 0.13
	);

	Pfsm([
		#[0],

		~pbind1,
		#[1],

		~pbind2,
		#[0]
	]).play(t);

});

)