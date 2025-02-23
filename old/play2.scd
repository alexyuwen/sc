//

(

s.waitForBoot({

	SynthDef(\src, {
		arg amp = 0.4;

		var numFreqModulators = 44;
		var randNums;
		var freq;
		var sig;

		randNums ={ exprand(0.1, 5) }.dup(numFreqModulators);

		["randNums", randNums].postln;

		freq = randNums.collect({
			arg x, i;

			var modulatorFreq = x;
			var range = modulatorFreq.expexp(0.1, 5, 200, 20);

			range.postln;

			SinOsc.ar(freq: modulatorFreq, phase: -0.5pi).bipolar(range);
		}).sum;

		freq = freq + SinOsc.ar(freq: 1 / 15, phase: -0.5pi).range(400, 2000);

		sig = VarSaw.ar(freq: freq, width: 0.4) * amp;

		Out.ar(0, sig ! 2);
	}).add;



	s.sync;



	Synth(\src);

});

)