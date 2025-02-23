// Companion Code 11.1: SynthDefs
// A State-Based Composition - An Automated Markov Chain Approach

// This sub-file contains the SynthDefs used in the project. With the exception of \pulses, all of these SynthDefs also appear in Companion Code 10.1. The only change is the addition of a doneAction argument to allow the flexibility of specifying pausing or freeing when the envelope is complete.

SynthDef.new(\dist, { // adapted from Companion Code 3.11
	arg atk = 0.02, rel = 3, gate = 1, done = 2, freq = 300, cutoff_harm = 8,
	amp = 0.3, fxamp = 0, out = 0, fxout = 0;
	var sig, sig_array, env, ampmod;
	env = Env.asr(atk, 1, rel, [2, -2]).ar(done, gate);
	sig_array = 8.collect({
		sig = SinOsc.ar(freq * LFNoise1.kr(0.3).bipolar(0.1).midiratio);
		ampmod = LFNoise2.kr(0.5).exprange(1.05, 8);
		sig = (sig * ampmod).tanh;
		sig = LPF.ar(sig, (freq * cutoff_harm).clip(20, 20000));
	});
	sig = Splay.ar(sig_array);
	sig = sig * env;
	Out.ar(fxout, sig * fxamp);
	Out.ar(out, sig * amp);
}).add;

SynthDef.new(\play, { // adapted from Companion Code 4.2
	arg atk = 0.02, rel = 1, gate = 1, done = 2, buf = 0, rate = 1, t_trig = 1, pan = 0,
	start = 0, loop = 0, lpf = 20000, amp = 0.3, fxamp = 0, out = 0, fxout = 0;
	var sig, env;
	env = Env.asr(atk, 1, rel, [2, -2]).ar(done, gate);
	rate = rate * BufRateScale.kr(buf);
	sig = PlayBuf.ar(2, buf, rate, t_trig, start, loop);
	sig = LPF.ar(sig, lpf.clip(20, 20000));
	sig = Balance2.ar(sig[0], sig[1], pan) * env;
	Out.ar(fxout, sig * fxamp);
	Out.ar(out, sig * amp);
}).add;

SynthDef(\pulses, {
	arg gate = 1, atk = 15, rel = 15, done = 2,
	amp = 0.15, fxamp = 0, out = 0, fxout = 0;
	var sig, env, freq, pulseHz;
	env = Env.asr(atk, 1, rel, [2, -2]).ar(done, gate);
	freq = 475 * [1, 1.02];
	freq = freq * LFNoise0.kr([0.1, 0.12]).range(19/20, 20/19);
	pulseHz = LFNoise2.kr(0.1 ! 2).range(8.75, 9.25);
	sig = Decay2.ar(Impulse.ar(pulseHz), 0.001, 0.03, LFNoise2.ar(2000));
	sig = sig.blend(BPF.ar(sig, freq.clip(20, 20000), 0.01, 25), 0.5);
	sig = sig * LFDNoise3.kr(LFNoise1.kr(8 ! 2).exprange(0.1, 8)).exprange(0.01, 1);
	sig = sig * env;
	Out.ar(fxout, sig * fxamp);
	Out.ar(out, sig * amp);
}).add;

SynthDef.new(\granular, { // adapted from Companion Code 4.6
	arg buf = 0, sync = 1, trigHz = 30, grainDur = 0.1, grainDurDev = 1,
	initPos = 0, posRate = 1, frameDev = 0, pch = 0, pchDev = 0,
	lpf = 20000, pan = 0, panDev = 0, interp = 2, grainEnv = (-1),
	atk = 0.01, rel = 0.01, gate = 1, done = 2, amp = 0.3, fxamp = 0, out = 0, fxout = 0;
	var sig, env, startPos, grainDurRand, pchRand, panRand;
	env = Env.asr(atk, 1, rel, [2, -2]).ar(done, gate);
	grainDurRand = LFDNoise0.kr(500).exprange(1/grainDurDev, grainDurDev);
	pchRand = LFDNoise0.kr(500).bipolar(pchDev);
	panRand = LFDNoise0.kr(500).bipolar(panDev);
	startPos = Phasor.ar(0, posRate * BufRateScale.ir(buf), 0, BufFrames.ir(buf));
	startPos = startPos + initPos;
	startPos = startPos + LFDNoise0.kr(500).bipolar(frameDev);
	startPos = startPos / BufFrames.ir(buf);
	sig = GrainBuf.ar(
		numChannels: 2,
		trigger: Select.ar(
			sync,
			[
				Dust.ar(trigHz),
				Impulse.ar(trigHz)
			]
		),
		dur: grainDur * grainDurRand,
		sndbuf: buf,
		rate: (pch + pchRand).midiratio,
		pos: startPos,
		interp: interp,
		pan: (pan + panRand).clip(-1, 1),
		envbufnum: grainEnv
	);
	sig = LPF.ar(sig, lpf.clip(20, 20000));
	sig = sig * env;
	Out.ar(fxout, sig * fxamp);
	Out.ar(out, sig * amp);
}).add;

SynthDef(\reverb, { // adapted from Companion Code 6.3
	arg in = 0, out = 0, fb = 0.85, fb_lag = 3, amp = 1;
	var sig, wet;
	sig = In.ar(in, 2);
	wet = LocalIn.ar(2) + sig;
	wet = DelayN.ar(wet, 0.03, 0.03);
	5.do({ |n|
		var del, coef, dec;
		del = { Rand(0.1 / (n + 2), 0.1 / (n + 1)) } ! 2;
		coef = Rand(0.6, 0.75);
		dec = del / (log10(coef) / 3.neg);
		wet = AllpassN.ar(wet, 0.1, del, dec);
	});
	LocalOut.ar(wet * fb.varlag(fb_lag, 0));
	sig = sig + wet;
	Out.ar(out, sig * amp);
}).add;