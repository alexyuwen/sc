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

// Helper function
(

~invertedXLine = { arg start = 1.0, end = 2.0, dur = 1.0, mul = 1.0, add = 0.0, doneAction = 0;
	var offset; // offset from zero
	var startAdjusted, endAdjusted;
	var backwardXLine;
	var result;

	if ((start < 0) && (end < 0)) {
		offset = max(start, end);
		offset.postln;
	} {
		if ((start > 0) && (end > 0)) {
			offset = min(start, end);
			offset.postln;
		} {
			if (start <= 0) {
				0.postln;
			} {
				if (end <= 0) {
					0.postln;
				}
			}
		}
	};

	startAdjusted = start - offset;
	endAdjusted = end - offset;

	if (offset < 0) {
		offset -= 0.01
	} {
		//
	};

	backwardXLine = XLine.ar(end, start, dur, mul, add, doneAction);

	result = (mul * start) - backwardXLine;
	result = result / mul;
};

)

{XLine.ar(0.1, 10).poll}.play;

// Test helper function with .poll
{~invertedXLine.value(start: 1000, end: 50, dur: 10, mul: 0.1).poll}.play;

// Pulse slowing down
(

{
	var notesPerSecond = ~invertedXLine.value(start: 155, end: 5, dur: 10, mul: 0.1);
	SinOsc.ar(freq: LFNoise0.kr(freq: notesPerSecond).range(222, 2222), mul: 0.1)
}.play;

)

{XLine.ar(start: 10, end: 1010, dur: 6, mul: 0.1).poll}.play;