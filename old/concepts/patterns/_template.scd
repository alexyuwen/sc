/*



*/



// Exercise 1:
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