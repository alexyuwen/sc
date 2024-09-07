/*

/////////
NOTES
/////////

- Pfunc, Prout?

*/



(

s.waitForBoot({

	SynthDef(\src, {
		arg out = 0, freq = 440, amp = 0.1, pan = 0, level = 0.2;

		var env;
		var sig;

		env = EnvGen.kr(
			envelope: Env.perc(
				attackTime: 0.01,
				releaseTime: 0.2,
				level: level,
				curve: -4
			),
			doneAction: 2
		);

		sig = Pulse.ar(freq: freq * [1, 1], width: 0.55, mul: env);

		sig = RLPF.ar(
			in: sig,
			freq: freq,
			rq: 0.1
		);

		sig = Balance2.ar(sig[0], sig[1], pan);

		Out.ar(out, sig * amp);
	}).add;



	s.sync;



	t = TempoClock(60/60);

	~r = p{
		var i = 0;
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

		segments = segments.collect({ |x| x.dupEach(2); });

		inf.do({

			segment2Count = 0;
			randNum = rrand(1, 3);
			segmentsCount = 0;

			while(
				{ segment2Count < randNum && segmentsCount < 9 },
				{
					i = randomIndices.next;
					i.postln;

					if(
						i == 2,
						{ segment2Count = segment2Count + 1; }
					);

					segmentsCount = segmentsCount + 1;

					segments[i].do({ |x| x.yield });
				}
			);

			([0] ++ \rest.dup(8 * [1, 3].choose - 1)).do({ |x| x.yield });

		});

	};

	Ptpar([

		0,
		Pbind(
			\instrument, \src,

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

			\scale, Scale.harmonicMinor,
			\degree, ~r,

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