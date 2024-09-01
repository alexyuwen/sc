// Apply Shepard effect to parameters other than pitch

// Pulse slowing down
(

f = {
	var env;
	var notesPerSecond;
	var notes;

	env = Env(levels: [20, 8, 8], times: [12, 9999], curve: -2);

	notesPerSecond = EnvGen.kr(env, doneAction: 2);

	notes = SinOsc.ar(
		freq: LFNoise0.kr(freq: notesPerSecond).range(222, 2222),
		mul: 0.1);

	Out.ar([0, 1], notes);

};

g = {
	var b = Buffer.read(s, "C:/sc/media/Weapon Bow And Arrow Thump 01.wav");
	var playBuf = PlayBuf.ar(numChannels: 2, bufnum: b, rate: 1, loop: 1);

	Out.ar([0, 1], playBuf);
};

h = {
	//
};

)

(

f.play;
g.play;
h.play;

)