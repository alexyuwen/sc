/*

/////////
NOTES
/////////

*/



(

s.waitForBoot({

	// Load synths
	(PathName(thisProcess.nowExecutingPath).parentPath ++ "scripts/loadSynths.scd").load;



	s.sync;



	t = TempoClock(90/60);

	~basePattern = Pbind(
		\instrument, \cheapPiano1,

		\root, -1,
		\octave, 6,
		\scale, Scale.new([0, 1, 4, 5, 7, 8, 10])
	);

	~pbind = Pbindf(
		~basePattern,

		\degree, Pseq((0..14).mirror.drop(-1), inf),
		\dur, 0.16
	);

	~pbind.play;

	// TODO: Generalize the melodic patterns in all these Pbinds

});

)









(
// this SynthDef has a strong attack, emphasizing the articulation
SynthDef(\sawpulse, { |out, freq = 440, gate = 0.5, plfofreq = 6, mw = 0, ffreq = 2000, rq = 0.3, freqlag = 0.05, amp = 0.1|
	var sig, plfo, fcurve;
	plfo = SinOsc.kr(plfofreq, mul:mw, add:1);
	freq = Lag.kr(freq, freqlag) * plfo;
	fcurve = EnvGen.kr(Env.adsr(0, 0.3, 0.1, 20), gate);
	fcurve = (fcurve - 1).madd(0.7, 1) * ffreq;
	sig = Mix.ar([Pulse.ar(freq, 0.9), Saw.ar(freq*1.007)]);
	sig = RLPF.ar(sig, fcurve, rq)
	* EnvGen.kr(Env.adsr(0.04, 0.2, 0.6, 0.1), gate, doneAction: Done.freeSelf)
	* amp;
	Out.ar(out, sig ! 2)
}).add;
)

(
TempoClock.default.tempo = 100/60;

PmonoArtic(\sawpulse,
	\midinote, Pseq([78, 81, 78, 76, 78, 76], 1),
	\dur, Pseq(#[0.25, 1.25, 0.25, 0.25, 0.25, 0.25], 1),
	\sustain, Pseq(#[0.3, 1.2, 0.3, 0.2, 0.3, 0.2],1 ),
	// \sustain, Pn(1), // TODO: play around with sustain
	\amp, Pseq(#[1, 0.5, 0.75, 0.5, 0.75, 0.5], 1) * 0.4
).play;
)