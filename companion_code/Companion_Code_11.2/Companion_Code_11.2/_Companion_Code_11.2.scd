// Companion Code 11.2
// A State-Based Composition - Using a GUI for Live Interaction

// This companion code presents the same piece that appears in Companion Code 11.1, but this version uses a GUI to facilitate real-time human interaction, instead of an automated approach using Markov chains. This file is the main file, from which external sub-files are remotely evaluated. Evaluating the following small block of code will trigger the complete setup sequence. Additional comments are included in sub-files.

(
"init_pre-boot.scd".loadRelative;
s.waitForBoot({
	"synthdefs.scd".loadRelative;
	"buffers.scd".loadRelative;
	s.sync;
	"init_post-boot.scd".loadRelative;
	"gui.scd".loadRelative;
	"*** setup complete! ***".postln;
});
)