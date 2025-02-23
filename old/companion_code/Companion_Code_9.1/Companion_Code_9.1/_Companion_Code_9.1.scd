// Companion Code 9.1
// A Template for Large-Scale Projects

// In this Companion Code, we piece together concepts from Chapter 9 (with the exception of the sclang startup file) to build a template structure that can be augmented and adapted for various types of large-scale projects. There are many different ways a project can be deconstructed and distributed into separate files; this is just one example meant to be simple and effective. This file is the main file, from which external sub-files are remotely evaluated. Evaluating the following small block of code will trigger the complete setup sequence. Comments are also included in the sub-files.

(
"init_pre-boot.scd".loadRelative;
"patterns.scd".loadRelative;
s.waitForBoot({
	"synthdefs.scd".loadRelative;
	"buffers.scd".loadRelative;
	s.sync;
	"init_post-boot.scd".loadRelative;
	"*** setup complete! ***".postln;
});
)

// This Companion Code focuses on setup and initialization code, rather than creating interesting performance code. Approaches for organizing musical events in a performance context are explored in the next few chapters. As a proof-of-concept to demonstrate the functionality of this template structure, a few sound-producing code snippets are included below.

(
Synth(\play, [
	buf: b[\sax][0],
	rate: 0.8,
	amp: 0.3,
	out: ~fxBus
], ~srcGroup);
)

(
([0, 0.3] + rrand(-13.0, -7.0)).do({ |n|
	Synth(\play, [
		buf: b[\pipe][0],
		rate: n.midiratio,
		amp: 0.2,
		out: ~fxBus
	], ~srcGroup);
});
)

p[\play0].play; // Pbind with pipe sample

p[\dist0].play; // Pbind with gently distorted sines