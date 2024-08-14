"Hello World".postln;

{SinOsc.ar}.play;

{SinOsc.ar(LFNoise0.kr(10).range(500, 1500), mul: 0.1)}.play;

{RLPF.ar(Dust.ar([1, 1]), LFNoise1.ar([0.3, 0.2]).range(1, 1), 0.02)}.play;

// G E Db-----C

// Sounds like old telephone
{Out.ar(bus: LFPulse.kr(20), channelsArray: SinOsc.ar(freq: 2000, mul: 0.1))}.play;

// Sounds like helicopter
{Out.ar(bus: LFPulse.kr(44), channelsArray: SinOsc.ar(freq: 40, mul: 0.1))}.play;



// Use for-loop to duplicate SinOsc random notes
(

for (0, 9) {
	{
		SinOsc.ar(freq: LFNoise0.kr(freq: 1).range(222, 2222), mul: 0.1)
	}.play;
}

)



// Apply Shepard effect to parameters other than pitch

// Pulse slowing down
(

f = {
	var env;
	var notesPerSecond;

	env = Env(levels: [20, 8, 8], times: [15, 9999], curve: -2);
	notesPerSecond = EnvGen.kr(env, doneAction: 2);

	SinOsc.ar(
		freq: LFNoise0.kr(freq: notesPerSecond).range(222, 2222),
		mul: 0.1);
};

g = {
	b = Buffer.read(s, "C:/sc/media/Weapon Bow And Arrow Thump 01.wav");
	PlayBuf.ar(2, b, loop: 1);
};

h = {
//
};

)

(

f.play;
// g.play;
// h.play;

)