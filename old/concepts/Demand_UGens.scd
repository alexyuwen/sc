// Alternative to Scale and Tuning.

(

var rootFreq = 220;
// var edo = 8;
var degreeToFreq = { |x| rootFreq * 2.pow(x / edo); };
var scale;
var freqs;
var degrees;

scale = (0 .. edo);
degrees = (0 .. 3 * edo).mirror;
freqs = degrees.collect({ |x| degreeToFreq.(x); });

{
	var notesPerBeat = 4;
	var freq;

	freq = Demand.kr(
		trig: Impulse.kr(freq: notesPerBeat),
		reset: 0,
		// demandUGens: Dseq(list: freqs, repeats: inf)
		demandUGens: degreeToFreq.(Dbrown(lo: 0, hi: edo * 3, step: 2, length: inf))
	);

	// freq = freq.varlag(time: 0.01, curvature: 0);

	SinOsc.ar(freq: freq, mul: 0.4 ! 2);
}.play;

)