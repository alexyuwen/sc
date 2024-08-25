// Companion Code 11.1: State Data
// A State-Based Composition - An Automated Markov Chain Approach

// This sub-file contains language-side variables, collections, and functions related to state information. Additional comments are included throughout.

// There are eight modules in this pieces, defined and instantiated in the "init_post-boot.scd" file. The names of the modules are: \melody, \clunks, \pulses, \grainDrone, \fluteRhythm, \beeps, \grainPhase, and \noiseDrone.

// Here, we define an array of composite states, loosely ordered from sparse to dense. The final state is the empty state, used for ending the piece.

~states = [
	/* 0 */ [\beeps, \noiseDrone],
	/* 1 */ [\beeps, \pulses],
	/* 2 */ [\noiseDrone, \grainDrone, \clunks],
	/* 3 */ [\noiseDrone, \pulses, \fluteRhythm, \grainPhase],
	/* 4 */ [\pulses, \fluteRhythm, \noiseDrone, \melody],
	/* 5 */ [\grainPhase, \clunks, \melody, \grainDrone],
	/* 6 */ [\pulses, \clunks, \grainPhase, \melody],
	/* 7 */ [\beeps, \fluteRhythm, \melody, \grainDrone],
	/* 8 */ [\beeps, \grainPhase, \grainDrone, \clunks, \melody, \fluteRhythm, \noiseDrone, \pulses],
	/* 9 */ [ ],
];

// Next, we create an array of probabilities that govern state changes. As a starting point, all sound-generating states are equally likely to be selected from every state, but no sound-generating state can move to itself (hence the diagonal row of zeros). After listening to the piece and becoming somewhat familiar with it, the reader is encouraged to manipulate these weight values in order to influence the state flow.

~targets = [
	/* 0 */ (states: (0..8), weights: [ 0, 1, 1, 1, 1, 1, 1, 1, 1 ].normalizeSum),
	/* 1 */ (states: (0..8), weights: [ 1, 0, 1, 1, 1, 1, 1, 1, 1 ].normalizeSum),
	/* 2 */ (states: (0..8), weights: [ 1, 1, 0, 1, 1, 1, 1, 1, 1 ].normalizeSum),
	/* 3 */ (states: (0..8), weights: [ 1, 1, 1, 0, 1, 1, 1, 1, 1 ].normalizeSum),
	/* 4 */ (states: (0..8), weights: [ 1, 1, 1, 1, 0, 1, 1, 1, 1 ].normalizeSum),
	/* 5 */ (states: (0..8), weights: [ 1, 1, 1, 1, 1, 0, 1, 1, 1 ].normalizeSum),
	/* 6 */ (states: (0..8), weights: [ 1, 1, 1, 1, 1, 1, 0, 1, 1 ].normalizeSum),
	/* 7 */ (states: (0..8), weights: [ 1, 1, 1, 1, 1, 1, 1, 0, 1 ].normalizeSum),
	/* 8 */ (states: (0..8), weights: [ 1, 1, 1, 1, 1, 1, 1, 1, 0 ].normalizeSum),
	/* 9 */ (states: (0..8), weights: [ 1, 1, 1, 1, 1, 1, 1, 1, 1 ].normalizeSum),
];

// There are three one-shots, also defined in the "init_post-boot.scd" file. Only certain one-shots are possible at a given point in time, depending on the current state.

~oneShotTargets = [
	/* 0 */ [\comb],
	/* 1 */ [\insect],
	/* 2 */ [\comb, \insect],
	/* 3 */ [\comb, \insect],
	/* 4 */ [\comb, \insect],
	/* 5 */ [\comb, \boom],
	/* 6 */ [\comb, \boom],
	/* 7 */ [\comb, \boom, \insect],
	/* 8 */ [\comb, \boom, \insect],
	/* 9 */ [ ],
];

// We begin in the empty state.

~currState = [ ];

// As discussed in Chapter 11, the following "~playState" function is responsible for moving from state-to-state by crossfading relevant modules. Throughout the chapter, Synths and EventStreamPlayers were the only two types of modules we dealt with. But here, one of our modules is an Array of Synths, so we must augment the function to account for all three of these possibilities.

~playState = { |selection, fadedur = 15|

	~prevState = ~currState;
	~currState = ~states[selection].postln; // show current state in post window

	~modules.keys.do({ |module|

		// If the current state includes a module that was previously inactive,
		// fade it in. The specific fade-in code depends on whether the module
		// is an EventStreamPlayer, a Synth, or an Array (if it is an Array, we
		// assume it is an Array of Synths).
		if(~currState.includes(module) && ~prevState.includes(module).not)
		{
			case
			{ ~modules[module].class == EventStreamPlayer } {
				Pdefn(
					module,
					Pseq([
						// If a Pseg controls a Pattern's amplitude and starts at 0,
						// the first event in the stream will be silent. This can be
						// problematic with long \dur times, because the next event
						// will not occur until a significant amount of time has passed.
						// By starting at a near-zero value, we can avoid this problem
						// while still creating an audible fade-in.
						Env([0.1, 1], [fadedur], [1]).asPseg,
						Pseq([1], inf)
					], 1)
				);
				~modules[module].reset.play;
			}
			{ ~modules[module].class == Synth } {
				~modules[module].set(\gate, 1, \atk, fadedur).run(true);
			}
			{ ~modules[module].class == Array } {
				~modules[module].do({ |x| x.set(\gate, 1, \atk, fadedur).run(true) });
			};
		};

		// If the current state does not include a module
		// that was previously active, fade it out.
		if(~currState.includes(module).not && ~prevState.includes(module))
		{
			case
			{ ~modules[module].class == EventStreamPlayer } {
				Pdefn(module, Env([1, 0], [fadedur], [-1]).asPseg);
			}
			{ ~modules[module].class == Synth } {
				~modules[module].set(\gate, 0, \rel, fadedur);
			}
			{ ~modules[module].class == Array } {
				~modules[module].do({ |x| x.set(\gate, 0, \rel, fadedur) });
			};
		};
	});

	// The last statement of this function posts the entire module collection (a side-effect of 'do'), which is not helpful. So, we finish with a single backslash to effectively suppress this posting behavior.
	\;
};

// When played, this routine automates state flow. Arbitrarily, we begin in either state 0 or 1 (this can be freely changed). Inside the loop, we play the next state, determine where to go next, and wait.

~statePerformer = Routine({
	var next, time;
	next = [0, 1].choose;
	loop{
		~playState.(next);
		next = ~targets[next][\states].wchoose(~targets[next][\weights]);
		time = exprand(20, 80).round;
		("next state in " ++ time ++ " sec").postln;
		time.wait;
	};
});

// When played, this routine automates the performance of one-shots. Inside the loop, we wait for a time, then randomly select a one-shot based on what the current state allows, and play it.

~oneShotPerformer = Routine({
	var currIndex, selectedOneShot;
	loop{
		exprand(5, 40).wait;
		currIndex = ~states.collect({ |n| n == ~currState }).indexOf(true);
		if( ~oneShotTargets[currIndex].size > 0 ) {
			selectedOneShot = ~oneShotTargets[currIndex].choose;
			~oneShots[selectedOneShot].();
			(selectedOneShot ++ " one-shot").postln;
		};
	};
});

// When played, this routine ends the piece by stopping the performance routines and moving into the empty state.

~endPiece = Routine({
	var off = ~states.collect({ |state| state == [ ] }).indexOf(true);
	~statePerformer.stop;
	~oneShotPerformer.stop;
	~playState.(off);
});