// Exercise 1: Re-trigger an envelope at random intervals
// TODO

(

s.waitForBoot({

	SynthDef(\src, {
		var sig;

		sig = sig;

		Out.ar(0, sig);
	}).add;



	s.sync;



	~synth = Synth(\src);

});

)