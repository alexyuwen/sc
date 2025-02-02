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



	e = (
		playBass: false
	);

	t = TempoClock(60/60);

	~r = p{
		var randomIndex = 0;
		var randomIndices = Pxrand([0, 1, 2], inf).asStream;
		var indices = [0, 1, 2];
		var segments = [
			[0, 2, 2, 1],
			[0, 0, 1, 2],
			[0, -3, 0, -1]
		];
		var segment2Count;
		var randNum;
		var segmentsCount;
		var restSegments;

		segments = segments.collect({ |x| x.dupEach(2); });

		inf.do({

			segment2Count = 0;
			randNum = rrand(1, 3);
			segmentsCount = 0;

			while(
				{ (segment2Count < randNum) && (segmentsCount < 9) },
				{
					// Yield.
					segments[randomIndex].collect({
						arg x, i;
						var final;

						final = x;

						if(
							(segmentsCount == 0) && (0.coin) && (i < 2),
							{ final = \rest }
						);

						final;
					}).do({ |x| x.yield });

					// Increment values.
					if(
						randomIndex == 2,
						{ segment2Count = segment2Count + 1; }
					);

					segmentsCount = segmentsCount + 1;
					randomIndex = randomIndices.next;
				}
			);

			restSegments = \rest.dup([1, 3].choose * 8);
			if(
				segment2Count == randNum,
				e.playBass = true,
				restSegments[0] = \rest
			);

			restSegments.do({ |x| x.yield });

		});

	};

	Penvir(

		e,

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

				\degree, ~r,

				\amp, Env(
					levels: [0.5, 0.5],
					times: [2],
					curve: -0.4
				).asStream,

				\dur, 0.2 / 2
			),

			3,
			Pbind(
				\instrument, \src,

				\type, Pif(e.playBass, \note, \rest),

				\includeDouble, 0,

				\degree, -7,

				\amp, Env(
					levels: [1, 1],
					times: [2],
					curve: -0.4
				).asStream,

				\dur, 0.2
			)

		]),

		false

	).play(t);

});

)