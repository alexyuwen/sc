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

(

SynthDef(\src, {
	arg randomOffsets;

	var baseFreq = 60.midicps;
	var sig;

	randomOffsets = { TRand.kr(lo: 0.01, hi: baseFreq, trig: \t_trig.kr(0)) }.dup(3);

	sig = SinOsc.ar(freq: baseFreq + randomOffsets);

	sig = Splay.ar(sig);  // Mixes a multichannel signal to two channels.

	sig = sig * -6.dbamp;

	Out.ar(0, sig);
}).add;

)



(

~synth = Synth(\src);

)

(

~synth.set(\t_trig, 1);

)
























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































// Buffers

Buffer.freeAll;

(

// b = Buffer.read(s, "C:/sc/media/adobe/Horror Scary Human Female Scream 01.wav");
b = Buffer.readChannel(s, "C:/sc/media/adobe/Horror Scary Human Female Scream 01.wav", channels: 0);

)



(

b.play;
b.plot;
b.duration;
b.numFrames;
b.numChannels;
b.sampleRate;
s.sampleRate;
b.query;

)



(

SynthDef(\src, {
	arg amp = 0.5;

	var sig = List();

	{ rrand(440, 2200).lincurve(440, 2200, 440, 2200, 3) }.dup(2).do({
		arg freq;

		sig.add(SinOsc.ar(freq: freq) * amp);
	});

	Out.ar(0, sig);
}).add;

)



(

~synth = Synth(\src);

)




























// Additive synthesis

(

SynthDef(\src, {
	arg freq = 440, freqOffset = 0;

	var freqs;
	var sigs;
	var sig;

	freqOffset = LFTri.kr(freq: 1/16).range(0.01, freqOffset);
	freqs = freq + [0, freqOffset];

	sigs = [
		SinOsc.ar(freq: freqs, mul: \mul0.kr(0.2)),
		Pulse.ar(freq: freqs, width: \width1.kr(0.5), mul: \mul1.kr(0.01)),
		Saw.ar(freq: freqs, mul: \mul2.kr(0.01)),
		VarSaw.ar(freq: freqs, width: \width3.kr(0.5), mul: \mul3.kr(0.01))
	];

	sig = sigs.sum;

	Out.ar(0, sig);
}).add;

)

(

~synth = Synth(\src);

)

~synth.set(\freq, 700, \freqOffset, 0);
~synth.set(\mul0, 0.0, \mul1, 0.1, \mul2, 0.0, \mul3, 0.0);
~synth.set(\width1, 0.91, \width3, 0.4);















//

(

Routine({

	SynthDef(\src, {
		var ampEnv;
		var sig;

		ampEnv = EnvGen.kr(
			envelope: Env(
				levels: [0, 1, 0.1, 1, 0],
				times: [0, 1, 1, 0],
				curve: [0, -11, 11, 0],
				releaseNode: 3,
				loopNode: 0
			)
		);

		sig = SinOsc.ar(freq: ampEnv.linexp(0, 1, 300, 9000));

		sig = sig * 0.3;

		Out.ar(0, sig);
	}).add;



	s.sync;



	~synth = Synth(\src);

}).();

)