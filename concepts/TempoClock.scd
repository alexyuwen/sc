/*

More Pattern Techniques - Week 12 Fall 2019 MUS 499C - Intro to SuperCollider

*/



// Exercise 1:
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