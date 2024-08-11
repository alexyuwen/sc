"Hello World".postln;

{SinOsc.ar}.play;

{SinOsc.ar(LFNoise0.kr(10).range(500, 1500), mul: 0.1)}.play;

{RLPF.ar(Dust.ar([1, 1]), LFNoise1.ar([0.3, 0.2]).range(1, 1), 0.02)}.play;

// G E Db-----C

// Sounds like old telephone
{Out.ar(bus: LFPulse.kr(20), channelsArray: SinOsc.ar(freq: 2000, mul: 0.1))}.play;

// Sounds like helicopter
{Out.ar(bus: LFPulse.kr(44), channelsArray: SinOsc.ar(freq: 40, mul: 0.1))}.play;