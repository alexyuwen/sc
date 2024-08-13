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

{
	var notesPerSecond = ~invertedXLine.value(start: 155, end: 5, dur: 10, mul: 0.1);

	var notesPerSecond = Env.

	SinOsc.ar(freq: LFNoise0.kr(freq: notesPerSecond).range(222, 2222), mul: 0.1)
}.play;

)

(Env.asr(attackTime: 0, sustainLevel: 20, releaseTime: 20, curve: -2).kr + 5).plot;

Env.asr

// Define a simple binary operation
(
{
var sig1, sig2, binaryOp;
sig1 = SinOsc.ar(440);
sig2 = SinOsc.ar(220);
binaryOp = sig1 + sig2; // Binary operation (addition)
}.plot;
)