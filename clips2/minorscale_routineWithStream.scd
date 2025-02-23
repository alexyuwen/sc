/*
Author Unknown

Modified by Bruno Ruviaro and Josh Mitchell 8/19.
*/

(SynthDef("pmCrotales", {
	arg out = 0, freq = 261, tone = 3, att = 0, rel = 2, curve = -6, amp = 0.8, pan = 0, modLo = 5.25, modHi = 5.5;

	var env, snd, mod;

	env = Env.perc(attackTime: 0, releaseTime: rel, curve: curve).kr(doneAction: 2);

	mod = Rand(modLo, modHi);

	snd = PMOsc.ar(
	    	carfreq: freq,
	    	modfreq: mod * freq,
	    	pmindex: env * tone,
	    	mul: env * amp
	    );

	snd = HPF.ar(snd, freq / 2);

	snd = Mix.ar(snd) * 0.1;

	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "Author Unknown",
	category: \percussion,
	tags: [\pitched, \bell]
	)
).add;)

(

Routine({
	var scale = Scale.minor;
	var degrees = Pseq((0..7).mirror.drop(-1), inf).asStream;
	var freq;

	inf.do({
		arg x;

		freq = scale.degreeToFreq(degree: degrees.next, rootFreq: 220, octave: 0);
		freq.postln;

		Synth("pmCrotales", [freq: freq]);

		0.2.wait;
	})
}).play;

)