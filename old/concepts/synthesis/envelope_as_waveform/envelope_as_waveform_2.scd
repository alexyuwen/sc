//

(

s.waitForBoot({

	SynthDef(\src, {
		arg freq = 440, amp = 0.1;

		var period = freq.reciprocal;
		var sig;

		sig = EnvGen.ar(
			envelope: Env(
				levels: [0, -1, 1, -1, 0],
				times: [0, period / 2, period / 2, 0],
				curve: [0, 0, 3, 0],
				releaseNode: 3,
				loopNode: 0
			),
			levelScale: amp
		);

		Out.ar(0, sig ! 2);
	}).add;



	s.sync;



	r{
		var amp = 0.5;
		var dur = 0.2;

		var midiNote = 40;

		~synth = Synth(\src, [\freq, midiNote.midicps, \amp, amp]);

		inf.do({
			~synth.set(\freq, midiNote.midicps, \amp, amp);
			midiNote = midiNote + 1;

			dur.yield;
		});
	}.play;

});

)