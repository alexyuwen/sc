/*

/////////
NOTES
/////////

-

*/



(

s.waitForBoot({

	~path = PathName(thisProcess.nowExecutingPath).parentPath;
	~synthFile = ~path ++ "synths/steelDrum.scd";
	~synthFile.load();



	s.sync;



	t = TempoClock(50/60);



	~pbind1 = Pbind(
		\instrument, \steelDrum,

		\root, -1,
		\octave, 6,
		\scale, Scale.harmonicMajor,
		\degree, Pn(Pseq([0]), 2),
		\includeDouble, 0,

		\amp, 0.1,

		\dur, 0.25
	);

	~pbind2 = Pbind(
		\instrument, \steelDrum,

		\root, -1,
		\octave, 6,
		\scale, Scale.harmonicMajor,
		\degree, Pseq([4], 4),
		\includeDouble, 0,

		\amp, 0.1,

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