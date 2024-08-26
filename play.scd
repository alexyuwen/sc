// Turn \gate into a trigger-type argument.

(

SynthDef(\src, {
	var ampEnv;
	var sig;

	ampEnv = EnvGen.kr(
		envelope: Env(
			levels: [0, 1, 0],
			times: [0.01, 1],
			curve: 0
		),
		gate: \t_gate.kr(1)
	);

	sig = SinOsc.ar;
	sig = sig * ampEnv * -6.dbamp;

	Out.ar(0, sig);
}).add;

)



(

~synth = Synth(\src);

)

~synth.set(\t_gate, 1);











// Pan2

(

SynthDef(\src, {
	var sig;

	sig = SinOsc.ar;

	sig = Pan2.ar(in: sig, pos: LFPulse.kr(freq: 1 / 2).range(-1, 1));
	sig = sig * -6.dbamp;

	Out.ar(0, sig);
}).add;

)



(

~synth = Synth(\src);

)
















// Splay
// TODO: How to print values of randomOffsets?  It didn't work inside the SynthDef because there, all that exists are Rand UGens.

(

SynthDef(\src, {
	var baseFreq = 60.midicps;

	var randomOffsets;
	var sig;

	randomOffsets = { TRand.kr(lo: 0.01, hi: 2 * baseFreq, trig: \t_trig.kr(0)) }.dup(3);

	sig = SinOsc.ar(freq: baseFreq + randomOffsets);

	sig = Splay.ar(sig);  // Mixes a multichannel signal to two channels.

	sig = sig * -6.dbamp;

	Out.ar(0, sig);
}).add;

)



(

~synth = Synth(\src);

)

~synth.set(\t_trig, 1);

































// midicps, cpsmidi, midiratio, ratiomidi

(

SynthDef(\src, {
	var sig;

	sig = SinOsc.ar(freq: \baseFreq.kr(0) * \freqMul.kr(1));

	sig = sig * \amp.kr(0.1);

	Out.ar(0, sig);
}).add;

)



(

~synth = Synth(\src);

// For efficiency reasons, it is preferable not to build these methods into a SynthDef, and instead call them when creating or modifying a Synth, so that the server does not have to repeatedly perform these calculations.
~synth.set(\baseFreq, 69.midicps, \freqMul, 1.midiratio, \amp, -6.dbamp);

)

































//

(

SynthDef(\src, {
	var sig;

	sig = SinOsc.ar();

	sig = sig * \amp.kr(0.1);

	Out.ar(0, sig);
}).add;

)



(

~synth = Synth(\src);

)





























//

(

SynthDef(\src, {
	var sig;

	sig = SinOsc.ar();

	sig = sig * \amp.kr(0.1);

	Out.ar(0, sig);
}).add;

)



(

~synth = Synth(\src);

)