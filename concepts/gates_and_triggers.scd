/*



*/



// Exercise 1: Re-trigger an envelope at random intervals
// TODO: Look into Impulse, Dust, and other related impulse classes.

(

s.waitForBoot({

	SynthDef(\src, {
		var sig;

		sig = Saw.ar(mul: 0.1);

		Out.ar(0, sig);
	}).add;



	s.sync;



	~synth = Synth(\src);

});

)