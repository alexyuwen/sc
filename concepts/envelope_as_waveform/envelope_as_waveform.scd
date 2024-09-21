// Use envelope chain as waveform.

(

s.waitForBoot({

	SynthDef(\src, {
		arg freq = 440, amp = 0.2, sustain = 0;

		var period = freq.reciprocal;
		var n = rrand(2, 8);
		var randNums;
		var ampEnv;
		var sig;

		ampEnv = EnvGen.kr(
			// envelope: Env.perc,
			envelope: Env.linen(sustainTime: sustain, releaseTime: 0.1),
			levelScale: amp ! 2,
			doneAction: 2
		);

		randNums = {rrand(-1, 1.0)}.dup(n).normalize;
		randNums = randNums ++ [randNums[0]];

		n.postln;
		randNums.postln;

		sig = EnvGen.ar(
			envelope: Env(
				levels: [0] ++ randNums ++ [0],
				times: [0] ++ (period / n).dup(n) ++ [0],
				curve: 0,
				releaseNode: n + 1,
				loopNode: 0
			)
		);

		sig = sig * ampEnv;

		Out.ar(0, sig);
	}).add;



	s.sync;

	r{
		var freq = 59.midicps;
		var sustain = 100;

		inf.do({
			Synth(\src, [\freq, freq, \sustain, sustain]);
			(sustain + 0.01).yield;
		})
	}.play;

});

)
















// "Add" envelopes as method of generating arbitrarily complex waveforms.

(

s.waitForBoot({

	~createWaveformGen = {
		arg n = 3, freq = 440;

		var waveformGen;

		waveformGen = {
			var period;
			var envelopes;
			var waveform;

			period = freq.reciprocal;

			envelopes = (2..n).collect({
				arg x, i;

				var randNums;

				randNums = {rrand(-1, 1.0)}.dup(x).normalize;
				randNums = randNums ++ [randNums[0]];

				x.postln;
				randNums.postln;

				EnvGen.ar(
					envelope: Env(
						levels: [0] ++ randNums ++ [0],
						times: [0] ++ (period / x).dup(x) ++ [0],
						curve: 0,
						releaseNode: x + 1,
						loopNode: 0
					)
				);
			});

			waveform = envelopes.sum / (n - 1);

			waveform;
		};
	};



	SynthDef(\src, {
		arg freq = 440, amp = 0.2;

		var n = 3;
		var waveformGen;
		var waveform;
		var sig;
		var ampEnv;

		ampEnv = EnvGen.kr(
			envelope: Env.asr,
			levelScale: amp ! 2,
			doneAction: 2
		);

		waveformGen = ~createWaveformGen.(freq: freq);

		waveform = waveformGen.();

		sig = waveform * ampEnv;

		Out.ar(0, sig);
	}).add;



	s.sync;



	r{
		var midiNote = 59;
		var freq = midiNote.midicps;

		~synth = Synth(\src, [\freq, freq]);

		inf.do({
			midiNote = midiNote + 1;
			freq = midiNote.midicps;

			~synth.set(\freq, freq);

			0.4.yield;
		})
	}.play;

});

)










// Just tests

(

var period = 440.reciprocal;
var waveform;

n = 3;

waveform = {

	var envelopes;
	var sig;

	envelopes = (2..n).collect({
		arg x, i;

		var randNums;

		randNums = {rrand(-1, 1.0)}.dup(x).normalize(-1, 1);
		randNums = randNums ++ [randNums[0]];

		x.postln;
		randNums.postln;

		EnvGen.ar(
			envelope: Env(
				levels: [0] ++ randNums ++ [0],
				times: [0] ++ (period / x).dup(x) ++ [0],
				curve: 0,
				releaseNode: x + 1,
				loopNode: 0
			)
		);
	});

	sig = envelopes.sum / (n - 1);

};

waveform.plot;

)