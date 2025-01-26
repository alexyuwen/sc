/*

/////////
NOTES
/////////

-

*/



(

s.waitForBoot({

	SynthDef(\src, {
		arg out = 0, freq = 440, amp = 0.1, pan = 0, level = 0.2, includeDouble = 1;

		var env;
		var sig;
		var sig2;
		var bothSigs;

		env = EnvGen.kr(
			envelope: Env.perc(
				attackTime: 0.01,
				releaseTime: 0.2,
				level: level,
				curve: -4
			),
			doneAction: 2
		);

		sig = Pulse.ar(freq: freq, width: 0.55, mul: env);

		sig = RLPF.ar(
			in: sig,
			freq: freq,
			rq: 0.1
		);

		sig2 = Pulse.ar(freq: freq * 2, width: 0.55, mul: env * 0.1);

		sig2 = RLPF.ar(
			in: sig2,
			freq: freq * 2,
			rq: 0.1
		);

		bothSigs = Balance2.ar(sig, sig2, pan);

		sig = Select.ar(
			includeDouble,
			[
				sig ! 2,
				bothSigs
			]
		);

		Out.ar(out, sig * amp);
	}).add;



	s.sync;



	t = TempoClock(60/60);

	~melodyNotes = Plazy({  // syntax shortcut for Plazy({}) is p{}
		var indices = [0, 1, 2];
		var segments = Pxrand([
			[0, 2, 2, 1],
			[0, 0, 1, 2],
			[0, -3, 0, -1]
		].collect({ |x| x.dupEach(2); }),
		inf).asStream;
		var segment2Count; // segment[2] count
		var randNum;
		var consecutiveSegmentsCount;
		var maxConsecutiveSegmentsCount = 9;
		var segment;

		inf.do({

			consecutiveSegmentsCount = 0;
			segment2Count = 0;
			randNum = rrand(1, 3); // segment2Count max

			while(
				{ (segment2Count < randNum) && (consecutiveSegmentsCount < maxConsecutiveSegmentsCount) },
				{
					segment = segments.next;

					if(
						segment == [0,  0, -3, -3, 0, 0, -1, -1],
						{ segment2Count = segment2Count + 1; }
					);

					// Yield.
					segment.do({ |x| x.yield; });

					consecutiveSegmentsCount = consecutiveSegmentsCount + 1;
				}
			);

			([1, 3].choose * 8).do({ \rest.yield; });

		});

	});

	Ptpar([

		0,
		Pbind(
			\instrument, \src,

			\includeDouble, 0,

			\amp, Env(
				levels: [0.66, 0.28],
				times: [3],
				curve: -2
			).asStream,

			\dur, 0.2,
		),

		1,
		Pbind(
			\instrument, \src,

			\includeDouble, 0,

			\degree, 4,

			\amp, Env(
				levels: [0.5, 0.15],
				times: [2],
				curve: -0.4
			).asStream,

			\dur, 0.301
		),

		3,
		Pbind(
			\instrument, \src,

			\includeDouble, 0,

			\scale, Scale.harmonicMinor,

			\degree, ~melodyNotes,

			\amp, Env(
				levels: [0.5, 0.5],
				times: [2],
				curve: -0.4
			).asStream,

			\dur, 0.2 / 2
		)

	]).play(t);

});

)