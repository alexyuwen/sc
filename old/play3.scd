// Try using \sustain on Pbind rather than a percussive envelope all the time.
// Try using \freq instead of \degree, and try rounding freq to multiples of a certain base.

(

s.waitForBoot({

	SynthDef(\src, {
		arg freq = 440, amp = 0.4, gate = 1, releaseTime = 0.4, releaseCurve = -4;

		var env;
		var sig;

		env = EnvGen.kr(
			envelope: Env.adsr(releaseTime: releaseTime, curve: releaseCurve),
			gate: gate,
			doneAction: 2
		);

		sig = VarSaw.ar(freq: freq, width: 0.2) * env * amp;

		Out.ar(0, sig ! 2);
	}).add;



	s.sync;



	Pbind(
		\instrument, \src,

		\dur, 0.4,
		\sustain, 0.2,

		\releaseTime, 0.4,
		\releaseCurve, -4
	).play;

});

)



(
SynthDef(\help_pindex, { | out, amp=0.1, freq=440, gate=1 |
    var son = Saw.ar(freq * [0.99, 1, 1.01]).mean;
    son = son * EnvGen.ar(Env.adsr, gate: gate, doneAction: Done.freeSelf);
    Out.ar(out, son.dup * amp);
}).add;
)

(
var data = [7, 13, 12, 2, 2, 2, 5];
var indices = [0, 0, 2, 0, 4, 6, 7];
Pbind(
    \instrument, \help_pindex,
    \choice, Prand(indices, inf),
    \degree, Pindex(data, Pkey(\choice), inf),
    \dur, 0.7
).play
)








(

~tuning = Tuning.et(pitchesPerOctave: 5);
~scale = Scale(degrees: 'ionian', pitchesPerOctave: 5, tuning: ~tuning, name: 'et5');

)