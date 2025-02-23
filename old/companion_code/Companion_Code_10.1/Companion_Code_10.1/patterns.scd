// Companion Code 10.1: Patterns
// An Event-Based Composition

// This sub-file defines all pattern objects relevant to the project. Pbindef is used to facilitate modification of individual key-value pairs. Because Pbindef objects "remember" their keys after they are stopped, it is sensible to clear all Pbindef objects first, to help avoid unexpected behavior.

Pbindef.all.do({ |p| p.clear });

Pbindef(\clunks,
	\instrument, \play,
	\dur, Pexprand(0.002, 1.5),
	\buf, ~b2[\drone][0],
	\atk, 0.01,
	\sustain, 0.01,
	\rel, 0.1,
	\start, Pwhite(0, ~b2[\drone][0].numFrames - 1000),
	\rate, Pwhite(-16, 16.0).midiratio,
	\pan, Pmeanrand(-0.5, 0.5),
	\amp, Pexprand(0.001, 0.12),
	\fxamp, Pkey(\amp) * 2,
	\fxout, ~fxBus,
	\out, 0,

	// If we only provide the name of the Group here, the Pbindef
	// associates itself with this particular Group instance. If
	// we then start and stop the composition, ServerTree will create
	// a new set of Group instances, with different node IDs, and
	// this pattern may no longer work correctly. Wrapping the Group
	// name in a Pfunc forces the pattern to re-evaluate the Group,
	// and helps avoid "Group not found" errors.
	\group, Pfunc({ ~srcGroup }),
);

Pbindef(\melody,
	\instrument, \dist,
	\midinote, Pxrand([69, 71, 72, 74, 76, 79], inf) + [0, 0.15],
	\atk, Pexprand(0.02, 0.08),
	\sustain, 0.5,
	\rel, 2,
	\dur, Pseq([
		2,
		Phprand(5.0, 12.0, 1),
	], inf),
	\cutoff_harm, Pexprand(2, 8),
	\amp, 0,
	\fxamp, 0.015,
	\fxout, ~fxBus,
	\out, 0,
	\group, Pfunc({ ~srcGroup }),
);

Pbindef(\fluteRhythm,
	\instrument, \play,
	\dur, 0.15,
	\buf, Pxrand(~b2[\flute], inf),
	\start, Pexprand(400, 900).round,
	\atk, 0.005,
	\sustain, 0.01,
	\rel, 0.3,
	\rate, Prand([-17,-5],inf).midiratio,
	\pan, Prand([
		Pseq(Array.interpolation(16, -0.9, 0.9), 1),
		Pseq(Array.interpolation(16, -0.9, 0.9).reverse, 1)
	], inf),
	\amp, Pseq([
		Pexprand(0.01, 0.7) * Env([0, 1], [10], [3]).asPseg,
		Pexprand(0.01, 0.7),
	], 1),
	\fxamp, 0.03,
	\fxout, ~fxBus,
	\out, 0,
	\group, Pfunc({ ~srcGroup }),
);