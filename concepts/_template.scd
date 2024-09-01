// Exercise 1:
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