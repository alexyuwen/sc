// Exercise 1: Splay.
// TODO: Exercise 1 complete.

(

s.waitForBoot({

	SynthDef(\src, {
		var sig;

		sig = Saw.ar(freq: [400, 600, 1000].reverse, mul: 0.2);

		sig = Splay.ar(inArray: sig, spread: \spread.kr(0));

		Out.ar(0, sig);
	}).add;



	s.sync;



	~synth = Synth(\src);

});

)

~synth.set(\spread, 0.4);