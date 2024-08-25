// Companion Code 9.1: SynthDefs
// A Template for Large-Scale Projects

// This sub-file contains all the SynthDefs used in the project.

SynthDef.new(\dist, { // adapted from Companion Code 3.11
	arg atk = 0.02, rel = 3, gate = 1, freq = 300,
	cutoff_harm = 8, amp = 0.2, out = 0;
	var sig, sig_array, env, ampmod;
	env = EnvGen.kr(Env.asr(atk, 1, rel), gate, doneAction: 2);
	sig_array = 8.collect({
		sig = SinOsc.ar(freq * LFNoise1.kr(0.3).bipolar(0.1).midiratio);
		ampmod = LFNoise2.kr(0.5).exprange(1.05, 1.75);
		sig = (sig * ampmod).tanh;
		sig = LPF.ar(sig, (freq * cutoff_harm).clip(20, 20000));
	});
	sig = Splay.ar(sig_array);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;

SynthDef.new(\play, { // adapted from Companion Code 4.2
	arg atk = 0.02, rel = 1, gate = 1, buf = 0, rate = 1,
	t_trig = 1, start = 0, loop = 0, amp = 0.5, out = 0;
	var sig, env;
	env = EnvGen.kr(Env.asr(atk, 1, rel), gate, doneAction: 2);
	rate = rate * BufRateScale.kr(buf);
	sig = PlayBuf.ar(2, buf, rate, t_trig, start, loop, doneAction: 2);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;

SynthDef(\reverb, { // adapted from Companion Code 6.3
	arg in = 0, out = 0, mix = 0.25, fb = 0.8;
	var sig, wet;
	sig = In.ar(in, 2);
	wet = LocalIn.ar(2) + sig; // read from local bus
	wet = DelayN.ar(wet, 0.03, 0.03);
	5.do({ |n|
		var del, coef, dec;
		del = { Rand(0.1 / (n + 2), 0.1 / (n + 1)) } ! 2;
		coef = Rand(0.6, 0.75);
		dec = del / (log10(coef) / 3.neg);
		wet = AllpassN.ar(wet, 0.1, del, dec);
	});
	LocalOut.ar(wet * fb); // apply feedback coefficient write to local bus
	sig = sig + (wet * mix);
	Out.ar(out, sig);
}).add;