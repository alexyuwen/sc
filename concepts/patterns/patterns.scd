/*

Patterns are a concise score language.

*/



// Exercise 1: Routines.
// TODO

(

s.waitForBoot({

	var freqs0, freqs1;

	SynthDef(\src, {
		arg freq = 440;

		var ampEnv;
		var sig;

		ampEnv = EnvGen.kr(
			envelope: Env.perc(releaseTime: 0.44),
			levelScale: 0.2,
			doneAction: 2
		);

		sig = Saw.ar(freq: freq, mul: ampEnv);

		Out.ar(0, sig);
	}).send(s);

	s.sync;

	freqs0 = Routine({
		loop({
			if(0.5.coin, { 600 + rrand(-6, 6) }, { 300 + rrand(-2, 2) }).yield;
		});
	});

	freqs1 = FuncStream(nextFunc: { [200, 400].wchoose(weights: [0.2, 0.8]) });

	Routine({
		loop({
			if(
				0.8.coin,
				{
					Synth(\src, [\freq, freqs0.next]);
					0.2.wait;
				},
				{
					var freq = freqs1.next;
					var dur = rrand(0.03, 0.06);
					rrand(4, 8).do({
						Synth(\src, [\freq, freq]);
						dur.wait;
					})
				}
			);
		});
	}).play;

});

)









































// Exercise 2: Patterns
// TODO: Why can't I modulate the amplitude with a UGen inside the SynthDef?
// There seems to be a conflict between the \dur Event symbol and the SynthDef EnvGen both trying to control the Node release on the server.

(

s.waitForBoot({

	SynthDef(\src, {
		arg freq = 440, amp = 0.2;

		var ampEnv;
		var widthGen;
		var sig;

		ampEnv = EnvGen.kr(
			envelope: Env.perc(releaseTime: \releaseTime.kr(0.1)),
			levelScale: amp,
			doneAction: 2
		);

		sig = VarSaw.ar(freq: freq, mul: ampEnv);

		Out.ar(0, sig);
	}).send(s);



	s.sync;

	~releaseTimes = (15..1).normalize / 2;

	Pbind(
		\instrument, \src,

		// \type, Pwrand([\note, \rest], [0.9, 0.1], inf),

		\freq, Prand(
			[
				Pseq([300, 400, 500], 1),
				Pseq([500, 450, 400], 1)
			],
			repeats: inf
		),
		\amp, Pmeanrand(0.1, 0.4, inf),
		\releaseTime, Pseq(list: ~releaseTimes, repeats: inf),

		\dur, Pdup(5, Pbrown(0.08, 0.2, 0.04, inf))
	).play;

});

)






































// Exercise 3: More patterns.
// TODO

(

s.waitForBoot({


	SynthDef(\src, {
		var sig;

		sig = SinOsc.ar(mul: Env.triangle.kr);

		Out.ar(0, sig);
	}).add;



	s.sync;



	Pbind(
		\instrument, \src,

		\sustain, 2
	).play;

});

)


































// Exercise 4: Prout.
// TODO

(

s.waitForBoot({

	SynthDef(\src, {
		var sig;

		sig = SinOsc.ar(mul: Env.linen(sustainTime: 0, releaseTime: 0.2).kr(doneAction: 2));

		Out.ar(0, sig);
	}).add;



	s.sync;



	Pbind(
		\instrument, \src,
	).play;

});

)







































// Exercise X:
// TODO

(

s.waitForBoot({

	SynthDef(\src, {
		var sig;

		sig = SinOsc.ar(mul: Env.linen(sustainTime: 0, releaseTime: 0.2).kr(doneAction: 2));

		Out.ar(0, sig);
	}).add;



	s.sync;



	Pbind(
		\instrument, \src,
	).play;

});

)










































// Exercise X:
// TODO

(

s.waitForBoot({

	SynthDef(\src, {
		var sig;

		sig = SinOsc.ar(mul: Env.linen(sustainTime: 0, releaseTime: 0.2).kr(doneAction: 2));

		Out.ar(0, sig);
	}).add;



	s.sync;



	Pbind(
		\instrument, \src,
	).play;

});

)








































// Exercise X:
// TODO

(

s.waitForBoot({

	SynthDef(\src, {
		var sig;

		sig = SinOsc.ar(mul: Env.linen(sustainTime: 0, releaseTime: 0.2).kr(doneAction: 2));

		Out.ar(0, sig);
	}).add;



	s.sync;



	Pbind(
		\instrument, \src,
	).play;

});

)








































// Exercise X:
// TODO

(

s.waitForBoot({

	SynthDef(\src, {
		var sig;

		sig = SinOsc.ar(mul: Env.linen(sustainTime: 0, releaseTime: 0.2).kr(doneAction: 2));

		Out.ar(0, sig);
	}).add;



	s.sync;



	Pbind(
		\instrument, \src,
	).play;

});

)




































