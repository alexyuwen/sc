/*

/////////
NOTES
/////////

*/



(

s.waitForBoot({

	// Load synths
	(PathName(thisProcess.nowExecutingPath).parentPath ++ "scripts/loadSynths.scd").load;



	s.sync;



	t = TempoClock(90/60);

	~basePattern = Pbind(
		\instrument, \pluck,

		\root, -1,
		\octave, 6,
		\scale, Scale.new([0, 1, 4, 5, 7, 8, 10])
	);

	~pbind1 = Pbindf(
		~basePattern,

		\degree, Pn(0, 1),
		\dur, 1
	);

	~pbind3 = Pbindf(
		~basePattern,

		\degree, Pseq([0, 1, -1], 1),
		\dur, 1 / 3
	);

	~pbind4 = Pbindf(
		~basePattern,

		\degree, Pseq([0, -1, -3, -1], 1),
		\dur, 1 / 4
	);

	~pbind5 = Pbindf(
		~basePattern,

		\degree, Pseq([0, -1, 1, -3, -1], 1),
		\dur, 1 / 5
	);

	~pbind6 = Pbindf(
		~basePattern,

		\degree, Pseq([0, -1, 1, -3, -1, -3], 1),
		\dur, 1 / 6
	);

	~pbind7 = Pbindf(
		~basePattern,

		\degree, Pseq([0, -1, 1, -1, 0, -3, -1], 1),
		\dur, 1 / 7
	);

	~pbind8 = Pbindf(
		~basePattern,

		\degree, Pseq([0, -1, 1, -1, 1, -3, -1, -3], 1),
		\dur, 1 / 8
	);

	  // The reason I can't increment pbind1Count inside the collect function for ~pbind1, as shown in the "Data Sharing" docs, is probably that numbers, unlike events, are immutable, so changes do not persist
	~pbind1Count = 0;
	~pbind1Increment = {
		~pbind1Count = ~pbind1Count + 1;
		("\t" ++ ~pbind1Count).postln;
		~pbind1Count;
	};

	Pdfsm(
		list: [
			// signalStream
			(Pn(0, 1) ++ Pwhite(0, 6)).trace,

			// state 0
			(
				0 : [0, Pn(~pbind1, ~pbind1Increment)],
				1 : [0, ~pbind3],
				2 : [0, ~pbind4],
				3 : [0, ~pbind5],
				4 : [0, ~pbind6],
				5 : [0, ~pbind7],
				6 : [0, ~pbind8]
			)
		],
		startState: 0
	).play(t);

});

)