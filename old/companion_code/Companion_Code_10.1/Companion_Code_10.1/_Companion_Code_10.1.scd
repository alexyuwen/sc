// Companion Code 10.1
// An Event-Based Composition

// This Companion Code presents an event-based composition that is still fairly small, but more elaborate and musically interesting than the examples that appear throughout Chapter 10. This project builds upon the setup techniques from Chapter 9 by adding musical events, rehearsal cues, and a simple GUI for interacting with the composition. This file is the main file, from which external sub-files are remotely evaluated. Evaluating the following small block of code will trigger the complete setup sequence. Additional comments are included in sub-files.

(
"init_pre-boot.scd".loadRelative;
s.waitForBoot({
	"synthdefs.scd".loadRelative;
	"buffers.scd".loadRelative;
	s.sync;
	"patterns.scd".loadRelative;
	"init_post-boot.scd".loadRelative;
	"events.scd".loadRelative;
	"cues.scd".loadRelative;
	"gui.scd".loadRelative;
	"*** setup complete! ***".postln;
});
)