SynthDef("ksBass", {
    arg
	// Standard Values
	out = 0, pan = 0, freq = 55, amp = 1, rel = 1.5,
    // Parameters for the impulse shape
	impulseAtt = 0.5, impulseSus = 1, impulseDec = 0.5, impulseHold = 1,
	// Filter and compressor parameters, thresh goes from 0 to 1.
	filtermin = 250, filtermax = 5000, rq = 0.35, thresh = 0.4, ratio = 2.5;

	var total, exciter, snd;

	// Rescale impulse values for the frequency of the note
	total = (impulseAtt + impulseSus + impulseDec + impulseHold) * freq;

	// Initial impulse
	exciter = Env.new(
		levels: [0, 1, 1, 0, 0],
		times: [impulseAtt, impulseSus, impulseDec, impulseHold]/total).ar;

	// Delay line
	snd = CombN.ar(
		in: exciter,
		maxdelaytime: 0.06,
		delaytime: 1/freq,
		decaytime: rel);

	// LPF
	snd = RLPF.ar(
		in: snd,
		freq: LinExp.ar(Amplitude.ar(in: snd), 0, 1, filtermin, filtermax),
		rq: rq);

	// Compressor for fun
	snd = CompanderD.ar(
		in: snd,
		thresh: thresh,
		slopeBelow: 1,
		slopeAbove: 1/ratio);

	// Output stuff
	snd = Mix.ar(snd) * amp;
	snd = Limiter.ar(snd);

	DetectSilence.ar(in: snd, doneAction: 2);

    Out.ar(out, Pan2.ar(snd, pan));

}).add;