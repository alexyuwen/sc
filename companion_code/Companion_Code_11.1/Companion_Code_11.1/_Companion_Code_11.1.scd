// Companion Code 11.1
// A State-Based Composition - An Automated Markov Chain Approach

// This companion code presents the same piece that appears in Companion Code 11.2, but this version uses Markov chains to generate a fully automated performance, rather than relying on real-time human interaction. This file is the main file, from which external sub-files are remotely evaluated. Evaluating the following small block of code will trigger the complete setup sequence. Additional comments are included in sub-files.

(
"init_pre-boot.scd".loadRelative;
"state_data.scd".loadRelative;
s.waitForBoot({
	"synthdefs.scd".loadRelative;
	"buffers.scd".loadRelative;
	s.sync;
	"init_post-boot.scd".loadRelative;
	"*** setup complete! ***".postln;
});
)

// Once loaded, the following chunk will start the piece. 10 minutes later, the piece will end.

(
~statePerformer.reset.play;
~oneShotPerformer.reset.play;
Routine({ 600.wait; ~endPiece.play; }).play;
)

// It is also possible to end the piece early:

~endPiece.play;