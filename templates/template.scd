/*



*/



(

s.waitForBoot({

	SynthDef(\src, {
		var sig;

		sig = SinOsc.ar;

		sig = sig * 0.2;

		Out.ar(0, sig);
	}).add;



	s.sync;



	~synth = Synth(\src);

})

)