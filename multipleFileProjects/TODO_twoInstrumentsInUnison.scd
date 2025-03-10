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



	~basePattern = Pbind(
		\root, -1,
		\octave, 6,
		\scale, Scale.new([0, 1, 4, 5, 7, 8, 10]),
		\dur, 1 / 5
	);

	~pbind1 = Pbindf(
		~basePattern,

		\instrument, \pluck,
		\degree, Plazy({
			Pseq(
				list: 5.collect({ rrand(0, 7) })
			);
		})
	).collect({
		arg event;

		~pbind1Event = event;
	});

	~pbind2 = Pbindf(
		~basePattern,

		\instrument, \fmBass,
		\degree, Pfunc({ ~pbind1Event[\degree] })
	);

	// TODO: ~pbind2 isn't stopping, after ~pbind1 is done
	Ppar([~pbind1, ~pbind2]).play(t);

});

)