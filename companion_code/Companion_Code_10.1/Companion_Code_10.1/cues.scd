// Companion Code 10.1: Cues
// An Event-Based Composition

// This sub-file contains rehearsal cues, stored in a dictionary. Four rehearsal points are established at the start of events 4, 6, 7, and 8.

~startAt = Dictionary()

.add(\event4 -> {

	~events.reset;
	4.do({ ~events.next });

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

			// Note that the Synth attack times have been drastically shortened
			// relative to their attack times in the events.scd file. As a result,
			// their sound will begin at full amplitude nearly instantaneously when this
			// rehearsal cue is called, avoiding having to wait through a long fade-in.
			atk: 0.02,

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
			trigHz: (53 + (n/7)).midicps,
			lpf: 75.midicps,
			initPos: 80000,
			posRate: 0,
			amp: 0,
			fxamp: 0.12,
			atk: 0.02,
			rel: 6,
			pan: n.linlin(0, 2, -0.3, 0.3),
			fxout: ~fxBus,
			out: 0
		], ~grainGroup);
	});

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
			atk: 0.02,
			rel: 8,
			pan: n.linlin(0, 2, -0.3, 0.3),
			fxout: ~fxBus,
			out: 0
		], ~grainGroup);
	});

	Pbindef(\clunks).play;
})

.add(\event6 -> {

	// The same Synths and Patterns that play at event 4 are also
	// playing when event 6 begins. Instead of copying and pasting
	// a large section of code, we can call the event 4 rehearsal
	// cue at this point, and then advance the event Stream forward
	// by two additional events.
	~startAt[\event4].();
	2.do({ ~events.next });

	Pbindef(\melody, \midinote, Pxrand([ 69, 71, 72, 74, 76, 79 ], inf) + [0, 0.15]).play;
	Pbindef(\fluteRhythm, \amp, Pexprand(0.01, 0.7)).play;

})

.add(\event7 -> {

	~events.reset;
	7.do({ ~events.next });

	Pbindef(\clunks).play;
	Pbindef(\melody, \midinote, Pxrand([ 65, 70, 72, 74, 77, 79 ], inf) + [0, 0.15]).play;
	Pbindef(\fluteRhythm, \amp, Pexprand(0.01, 0.7)).play;

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
			atk: 0.02,
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
			atk: 0.02,
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
			atk: 0.02,
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
			atk: 0.02,
			rel: 8,
			pan: n.linlin(0, 2, -0.3, 0.3),
			fxout: ~fxBus,
			out: 0
		], ~grainGroup);
	});
})

.add(\event8 -> {

	~events.reset;
	8.do({ ~events.next });

	Pbindef(\clunks).play;
	Pbindef(\melody, \midinote, Pxrand([ 65, 70, 72, 74, 77, 79 ], inf) + [0, 0.15]).play;
	Pbindef(\fluteRhythm, \amp, Pexprand(0.01, 0.7)).play;
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
			atk: 0.02,
			rel: 10,
			pan: n.linlin(0, 2, -0.3, 0.3),
			fxout: ~fxBus,
			out: 0
		], ~grainGroup);
	});
});