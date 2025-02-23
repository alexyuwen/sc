// Companion Code 9.1: Patterns
// A Template for Large-Scale Projects

// This sub-file defines all Pattern objects relevant to the project, and stores them in an Event so that they can be conveniently retrieved by name.

p = ();

p[\play0] = Pbind(
	\instrument, \play,
	\dur, Pseq([1/16], inf),
	\rate, (Pseq([0, 3, 5], inf) + Pseries(-2, 0.05, 60)).midiratio,
	\db, Pseries(-15, -0.5),
	\group, Pfunc({ ~srcGroup }),
	\out, Pfunc({ ~fxBus })
);

p[\dist0] = Pbind(
	\instrument, \dist,
	\dur, Pseq([1/16], inf),
	\atk, 0.005,
	\sustain, 0.01,
	\rel, 0.4,
	\note, (Pseq([5, 3, 0], inf) + Pseries(0, -0.05, 60)),
	\db, Pseries(-25, -0.5),
	\group, Pfunc({ ~srcGroup }),
	\out, Pfunc({ ~fxBus })
);