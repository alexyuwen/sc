/*

/////////
NOTES
/////////

-

*/



(

s.waitForBoot({

	~path = PathName(thisProcess.nowExecutingPath).parentPath;
	~synthFile = ~path ++ "synths/percussion_pitched/steelDrum.scd";
	~synthFile.load();



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

		\degree, r{
			inf.do({
				(0..rrand(7, 14)).mirror.drop(-1).do({ |x| x.yield });
			});
		},
		\dur, 0.08,
		\amp, 0.1
	);

	~pbind2 = Pbindf(
		~basePattern,

		\degree, 4,
		\dur, Pwhite(0.2, 0.6),
		\detune, {rrand(-10, 10)}, // {rrand} syntax works for detune and degree, but not dur
		\amp, 0.2,
	);

	~pbind3 = Pbindf(
		~basePattern,

		\note, 1,
		\dur, Pwhite(1, 3),
		\amp, 0.4
	);

	Ppar([~pbind1, ~pbind2, ~pbind3]).play(t);

});

)