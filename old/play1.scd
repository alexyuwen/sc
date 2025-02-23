//

(

s.waitForBoot({

	SynthDef(\src, {
		arg amp = 0.1, div = 5, releaseCurve = -3, freqModulationFreq = 1 / 8;

		var clock, pulseDivider;
		var env;

		var freq;

		var sig;

		clock = Impulse.ar(15);
		pulseDivider = PulseDivider.ar(trig: clock, div: div);

		env = EnvGen.ar(
			envelope: Env(
				levels: [0, 1, 0],
				times: [0.01, 0.8],
				curve: [0, releaseCurve]
			),
			gate: pulseDivider
		);

		freq = SinOsc.kr(freq: freqModulationFreq.varlag(0.2, -5), phase: -pi/2).range(50, 86).midicps;

		sig = VarSaw.ar(freq: freq, width: 0.4) * env;

		Out.ar(0, sig ! 2);
	}).add;



	s.sync;



	r{
		var amp = 0.5;

		var clock;
		var pulseDivider;


		~synth = Synth(\src);

		inf.do({
			~synth.set(\div, 5, \releaseCurve, -3, \freqModulationFreq, 1 / 8);

			1.6.yield;

			~synth.set(\div, 2, \releaseCurve, -20, \freqModulationFreq, 1 / 4);

			2.2.yield;
		});
	}.play;

});

)