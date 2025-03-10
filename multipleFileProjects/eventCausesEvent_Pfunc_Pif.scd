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



	t = TempoClock(60/60);



	~pbind1 = Pbind(
		\instrument, \cheapPiano1,
		\dur, Pn(1, 1) ++ Pwrand(list: [1, 3/4], weights: [2, 1].normalizeSum, repeats: inf)
	).collect({
		arg event;

		~pbind1Event = event;
	});

	~pbind2 = Pbind(
		\instrument, \apadMH,
		\note, Pif(
			Pfunc({ ~pbind1Event[\dur] == 1 }),  // Pfunc is needed in order to return a stream, which Pif expects as its first argument
			7,
			8
		),

		\dur, Pfunc({ ~pbind1Event[\dur] })  // Pfunc is needed in order to return a stream
	);

	Ppar([~pbind1, ~pbind2]).play(t);

});

)