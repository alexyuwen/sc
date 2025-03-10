SynthDef(\cymbal808, {
	arg
	//Standard Values:
	out = 0, pan = 0, att = 0.002, dec = 0.25, rel = 0.05, amp = 1.0,
	//Other Controls:
	freqMultiplier = 4.09, decLevel = 0.4, reverb = 0.33, size = 0.5, damp = 0.5;

	var snda, sndb, snd, env, pulseEnv, freqs;

	freqs = [205.35, 304.41, 369.64, 522.71, 540.54, 812.21];

	env = Env.new(
		levels: [0, 1, decLevel, 0],
		times: [att, dec, rel],
		curve: [0, -0.5, 0]
	).kr;

	pulseEnv = Env.new(
		levels: [1.0, 0.6],
		times: dec,
		curve: -0.5
	).kr;

	snd = Mix.ar(LFPulse.ar(freq: freqs * 4.09));

	snd = (BinaryOpUGen('==', snd, 6.0) * 0.6) + (BinaryOpUGen('==', snd, 2.0) * 0.2) + (BinaryOpUGen('==', snd, 1.0) * 0.9);

	snd = (snd * pulseEnv) + Mix.ar(LFPulse.ar(freq: freqs, width: 0.55, mul: 0.9));

	snd = RLPF.ar(in: snd, freq: 7000, rq: 0.6);
 	snd = RHPF.ar(in: snd, freq: 6800, rq: 1.5);
	snd = RHPF.ar(in: snd, freq: 6800, rq: 1.5);
	snd = RHPF.ar(in: snd, freq: 1200, rq: 1.5);

	snd = snd + FreeVerb.ar(in: snd, mix: reverb, room: size, damp: damp);
	snd = Mix.ar(snd);
	snd = snd * env * amp;

	DetectSilence.ar(in: snd, doneAction: 2);

	OffsetOut.ar(out, Pan2.ar(snd, pan));
}).add;