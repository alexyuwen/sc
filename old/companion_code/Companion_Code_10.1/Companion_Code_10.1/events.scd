// Companion Code 10.1: Events
// An Event-Based Composition

// This sub-file contains performance events, structured as a stream of functions. Each performance event concludes with a posted string, to visualize program status information at each step. Each event performs some combination of starting, altering, or stopping various sounds or sound sequences.

~events = Pseq([

	{
		// event 0
		3.collect({ |n|
			Synth(\granular, [
				buf: ~b1[\drone][0],
				sync: 1,
				trigHz: (31 + (n/8)).midicps,
				lpf: 80.midicps,
				initPos: 240000,
				posRate: 0,
				amp: 0,
				fxamp: 0.05,
				atk: 10,
				rel: 10,
				pan: n.linlin(0, 2, -0.3, 0.3),
				fxout: ~fxBus,
				out: 0
			], ~grainGroup);
		});
		"play granular drone 0".postln;
	},

	{
		// event 1
		3.collect({ |n|
			Synth(\granular, [
				buf: ~b1[\sax][0].numFrames,
				sync: 1,
				trigHz: (53 + (n/7)).midicps,
				lpf: 75.midicps,
				initPos: 80000,
				posRate: 0,
				amp: 0,
				fxamp: 0.12,
				atk: 6,
				rel: 6,
				pan: n.linlin(0, 2, -0.3, 0.3),
				fxout: ~fxBus,
				out: 0
			], ~grainGroup);
		});
		"play granular drone 1".postln;
	},

	// events 2 & 3 (indeterminate order)
	Pshuf([
		{
			3.collect({ |n|
				Synth(\granular, [
					buf: ~b1[\drone][0].numFrames,
					sync: 1,
					trigHz: (60 + (n/9)).midicps,
					lpf: 100.midicps,
					initPos: 200000,
					posRate: 0,
					amp: 0,
					fxamp: 0.025,
					atk: 8,
					rel: 8,
					pan: n.linlin(0, 2, -0.3, 0.3),
					fxout: ~fxBus,
					out: 0
				], ~grainGroup);
			});
			"play granular drone 2".postln;
		},

		{ Pbindef(\clunks).play; "play clunks pattern".postln; }
	], 1),

	{
		// event 4
		Pbindef(\melody,
			\midinote, Pxrand([ 69, 71, 72, 74, 76, 79 ], inf) + [0, 0.15]
		).play;
		"play melody pattern".postln;
	},

	{
		// event 5
		Pbindef(\fluteRhythm, \amp, Pseq([
			Pexprand(0.01, 0.7) * Env([0, 1], [10], [3]).asPseg,
			Pexprand(0.01, 0.7),
		], 1)).play;
		"play flute rhythm pattern".postln;
	},

	{
		// event 6
		~grainGroup.set(\gate, 0);

		Pbindef(\melody, \midinote, Pxrand([ 65, 70, 72, 74, 77, 79 ], inf) + [0, 0.15]);

		3.collect({ |n|
			Synth(\granular, [
				buf: ~b1[\drone][0],
				sync: 1,
				trigHz: (34 + (n/9)).midicps,
				lpf: 80.midicps,
				initPos: 240000,
				posRate: 0,
				amp: 0,
				fxamp: 0.065,
				atk: 10,
				rel: 10,
				pan: n.linlin(0, 2, -0.3, 0.3),
				fxout: ~fxBus,
				out: 0
			], ~grainGroup);
		});

		3.collect({ |n|
			Synth(\granular, [
				buf: ~b1[\sax][0].numFrames,
				sync: 1,
				trigHz: (55 + (n/8)).midicps,
				lpf: 85.midicps,
				initPos: 120000,
				posRate: 0,
				amp: 0,
				fxamp: 0.065,
				atk: 8,
				rel: 8,
				pan: n.linlin(0, 2, -0.3, 0.3),
				fxout: ~fxBus,
				out: 0
			], ~grainGroup);
		});

		3.collect({ |n|
			Synth(\granular, [
				buf: ~b1[\drone][0].numFrames,
				sync: 1,
				trigHz: (64 + (n/6)).midicps,
				lpf: 90.midicps,
				initPos: 300000,
				posRate: 0,
				amp: 0,
				fxamp: 0.016,
				atk: 8,
				rel: 8,
				pan: n.linlin(0, 2, -0.3, 0.3),
				fxout: ~fxBus,
				out: 0
			], ~grainGroup);
		});

		3.collect({ |n|
			Synth(\granular, [
				buf: ~b1[\drone][0].numFrames,
				sync: 1,
				trigHz: (65 + (n/7)).midicps,
				lpf: 95.midicps,
				initPos: 400000,
				posRate: 0,
				amp: 0,
				fxamp: 0.035,
				atk: 8,
				rel: 8,
				pan: n.linlin(0, 2, -0.3, 0.3),
				fxout: ~fxBus,
				out: 0
			], ~grainGroup);
		});

		"crossfade granular cluster, change melody notes".postln;
	},

	{
		// event 7
		~grainGroup.set(\gate, 0);

		3.collect({ |n|
			Synth(\granular, [
				buf: ~b1[\drone][0],
				sync: 1,
				trigHz: (36 + (n/9)).midicps,
				lpf: 70.midicps,
				initPos: 650000,
				posRate: 0,
				amp: 0,
				fxamp: 0.25,
				atk: 10,
				rel: 10,
				pan: n.linlin(0, 2, -0.3, 0.3),
				fxout: ~fxBus,
				out: 0
			], ~grainGroup);
		});

		"crossfade to single granular cluster".postln;
	},

	{
		// event 8
		Pbindef(\melody).stop;
		Pbindef(\fluteRhythm, \amp, Pexprand(0.01, 0.7) * Env([1, 0], [10], [-2]).asPseg);
		~grainGroup.set(\gate, 0);
		"fade everything except clunks pattern".postln;
	},

	{
		// event 9
		Pbindef(\clunks).stop; "fade clunks pattern".postln;
	}

], 1).asStream;