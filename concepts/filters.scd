/*



*/



// Exercise 1: RLPF (resonant low pass filter)
// TODO

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









































// Exercise 2: AllpassN.
// allpass filter: when delaying the signal at certain frequencies, which changes the phase, transients get smeared, so the levels are all there, but they don't happen at the same time like they used to.
// TODO

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