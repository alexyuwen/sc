// Companion Code 11.2: Post-Boot Setup
// A State-Based Composition - Using a GUI for Live Interaction

// This sub-file handles initialization tasks meant to occur after the server has booted and other server-related tasks are complete. Populating the server with Synths and Groups is perhaps the most likely action to occur here.

// This ~makeNodes function handles the process of instantiating Synths and Groups on the server. Although our ~modules Event contains a mix of data types (Synths, EventStreamPlayers, Arrays), it is nevertheless appropriate to include it in this function, since some of the items are live Synths. All of the Synths and EventStreamPlayers are initially paused.

~makeNodes = {

	~srcGroup = Group();
	~fxGroup = Group.after(~srcGroup);
	~reverb = Synth(\reverb, [in: ~fxBus, mix: 0.1], ~fxGroup);

	~modules = (

		beeps: Pbind(
			\instrument, \dist,
			\dur, Pwhite(2.0, 25.0),
			\atk, 0.001,
			\sustain, 0.01,
			\done, 2,
			\rel, 0.08,
			\freq, Pexprand(6000, 15000),
			\cutoff_harm, Pwhite(2.0, 8.0),
			\amp, Pexprand(0.008, 0.015) * Pdefn(\beeps, 1),
			\fxamp, Pexprand(0.002, 0.01) * Pdefn(\beeps, 1),
			\out, 0,
			\fxout, ~fxBus,
			\group, Pfunc({ ~srcGroup })
		).play.pause,

		grainPhase: 5.collect({ |n|
			Synth.newPaused(\granular, [
				buf: ~b1[\sax][0],
				sync: 1,
				trigHz: ((1..15).scramble / 200 + 2).choose,
				grainDur: exprand(0.02, 0.04),
				initPos: ~b1[\sax][0].numFrames * rrand(0.2, 0.8),
				posRate: 0.1,
				pch: rrand(-8.0, -2.0),
				amp: 0.1,
				fxamp: -50.dbamp,
				gate: 0,
				atk: 10,
				rel: 10,
				done: 1,
				pan: n.linlin(0, 4, -0.7, 0.7),
				fxout: ~fxBus,
				out: 0,
			], ~srcGroup);
		}),

		grainDrone: Pbind(
			\instrument, \granular,
			\dur, Pwhite(5.0, 15.0),
			\buf, ~b1[\drone][0],
			\sync, 1,
			\trigHz, Pfunc({
				var notes;
				notes = [
					[31, 45, 52, 54, 55],
					[36, 52, 55, 57, 59],
					[38, 48, 52, 54, 57]
				].choose +.x [0, 0.2];
				notes.midicps;
			}),
			\lpf, Pfunc({ |ev| ev[\trigHz] * {exprand(2, 6)}.dup(10) }),
			\grainDur, exprand(0.02, 0.2),
			\initPos, rrand(0.2, 0.7) * ~b1[\drone][0].numFrames,
			\posRate, rrand(-0.008, 0.008),
			\pch, rrand(-5.0, 0.0),
			\amp, 0.008 * Pdefn(\grainDrone, 1),
			\fxamp, 0.015 * Pdefn(\grainDrone, 1),
			\atk, 5,
			\sustain, Pkey(\dur * 1.15),
			\rel, 5,
			\done, 2,
			\pan, Array.interpolation(10, -0.3, 0.3),
			\fxout, ~fxBus,
			\out, 0,
			\group, Pfunc({ ~srcGroup })
		).play.pause,

		clunks: Pbind(
			\instrument, \play,
			\dur, Pexprand(0.002, 1.5),
			\buf, ~b2[\drone][0],
			\atk, 0.01,
			\sustain, 0.01,
			\rel, 0.1,
			\done, 2,
			\start, Pwhite(0, ~b2[\drone][0].numFrames - 1000),
			\rate, Pwhite(-16, 16.0).midiratio,
			\pan, Pmeanrand(-0.5, 0.5),
			\amp, Pexprand(0.001, 0.04) * Pdefn(\clunks, 1),
			\fxamp, Pkey(\amp) * 2 * Pdefn(\clunks, 1),
			\fxout, ~fxBus,
			\out, 0,
			\group, Pfunc({ ~srcGroup }),
		).play.pause,

		melody: Pbind(
			\instrument, \dist,
			\midinote, Pxrand([ 69, 71, 72, 74, 76, 79, 83 ], inf) + [0, 0.15],
			\atk, Pexprand(0.02, 0.5),
			\sustain, 0.5,
			\rel, Pexprand(1, 5),
			\done, 2,
			\dur, Pexprand(1, 25),
			\cutoff_harm, Pexprand(1, 4),
			\amp, 0 * Pdefn(\melody, 1),
			\fxamp, Pexprand(0.0005, 0.005) * Pdefn(\melody, 1),
			\fxout, ~fxBus,
			\out, 0,
			\group, Pfunc({ ~srcGroup }),
		).play.pause,

		fluteRhythm: Pbind(
			\instrument, \play,
			\dur, 0.15,
			\buf, Pxrand(~b2[\flute], inf),
			\start, Pexprand(400, 900).round,
			\atk, 0.005,
			\sustain, 0.01,
			\rel, 0.3,
			\done, 2,
			\rate, Prand([-17, -5], inf).midiratio,
			\pan, Prand([
				Pseq(Array.interpolation(16, -0.9, 0.9), 1),
				Pseq(Array.interpolation(16, -0.9, 0.9).reverse, 1)
			], inf),
			\amp, Pexprand(0.005, 0.2) * Pdefn(\fluteRhythm, 1),
			\fxamp, 0.01 * Pdefn(\fluteRhythm, 1),
			\fxout, ~fxBus,
			\out, 0,
			\group, Pfunc({ ~srcGroup }),
		).play.pause,

		noiseDrone: Pbind(
			\instrument, \play,
			\dur, 0.5,
			\buf, ~b2[\drone][0],
			\start, Pwhite(0, ~b2[\drone][0].numFrames - 1),
			\loop, 1,
			\rate, Pmeanrand(-6.0, -4.0).midiratio * Prand([1, -1], inf),
			\atk, 4,
			\sustain, 4,
			\rel, 4,
			\lpf, Pexprand(800, 1600),
			\pan, Pmeanrand(-0.7, 0.7),
			\amp, 0.005 * Pdefn(\noiseDrone, 1),
			\fxamp, 0.02 * Pdefn(\noiseDrone, 1),
			\out, 0,
			\fxout, ~fxBus,
			\group, Pfunc({ ~srcGroup }),
		).play.pause,

		pulses: Synth.newPaused(\pulses, [gate: 0, done: 1, atk: 15, rel: 15], ~srcGroup);
	);
};

// Here, we define a collection of one-shots as functions to be evaluated later. This code could technically be included in a different file (e.g. init_pre-boot or state-data), but it feels appropriate to bundle them in the same file as our modules.

~oneShots = (
	comb: {
		Pbind(
			\instrument, \play,
			\dur, Pgeom(rrand(0.01, 0.05), rrand(1.07, 1.09), 50),
			\atk, 0.01,
			\sustain, 0.01,
			\rel, 0.03,
			\buf, Prand(~b2[\flute], inf),
			\rate, rrand(33, 52).midiratio,
			\pan, Env({ rrand(-0.6, 0.6) } ! 2, [2], [rrand(-3.0, 3.0)]).asPseg,
			\start, Pwhite(0, 300),
			\lpf, Phprand(20, 20000),
			\db, Pseries(rrand(-15.0, -4.0), -1.5, inf),
			\out, 0,
			\fxout, ~fxBus,
			\fxamp, Pwhite(-40.0, -25.0).dbamp
		).play;
	},
	boom: {
		(
			instrument: \play,
			atk: 0.005,
			sustain: 0.01,
			rel: 2,
			buf: ~b2[\drone][0],
			start: rrand(150000, 250000),
			rate: rrand(-45, -35).midiratio,
			out: 0,
			amp: exprand(0.2, 0.4),
			fxout: ~fxBus,
			fxamp: 0.3
		).play;
	},
	insect: {
		(Array.exprand(8, 1, 1.5) * exprand(1000, 8000)).do({ |n|
			(
				instrument: \dist,
				amp: 0.001,
				fxamp: 0.001,
				out: 0,
				fxout: ~fxBus,
				freq: n,
				cutoff_harm: 2,
				atk: 2,
				sustain: 2,
				rel: 2
			).play;
		});
	}
);

// Because our modules exist as different data types (Synth, Array, EventStreamPlayer), we create a pair of functions to streamline the process of fading them in/out when activated/deactivated. These functions are adapted from the ~playState function in Companion Code 11.1. Because we are not concerned with composite states, the logic is simpler. Each function only needs to determine the data type of the module in order to send the appropriate fade in/out command.

~playModule = { |module, fadedur = 10|
	case
	{ ~modules[module].class == EventStreamPlayer } {
		Pdefn(
			module,
			Pseq([
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

~fadeModule = { |module, fadedur = 10|
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

// Finally, we register the ~makeNodes function with ServerTree, so that our Synths, Groups, and modules are reconstructed after command-period.

ServerTree.add(~makeNodes);
ServerTree.run;