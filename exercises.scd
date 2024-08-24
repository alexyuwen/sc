o = OSCFunc({ |msg| msg.postln }, '/tr', s.addr);

(
{
	var freq;

    freq = LFNoise1.kr(2, 600, 800);

	SendTrig.kr(Impulse.kr(4), 0, freq); // Impulse to trigger /tr message

    SinOsc.ar(freq, 0, 0.3) ! 2
}.play(fadeTime: 0);
)

o.free;









// Exercise 1: Modulate pitch range.
// Exercise 1 complete.

s.makeWindow;

(

~synth = {
	var sig, env, envGen, freqGen;

	env = Env.new(
			levels: [0, 0, 4, 0],
			times: [0, 6.6, 4],
			curve: [0, 2.2, 0],
			releaseNode: 2,
			loopNode: 0
	);

	envGen = EnvGen.kr(env, doneAction: 2);

	freqGen = LFNoise0.ar(freq: 6 + envGen).range(440, 440 + (envGen * 500));

	sig = SinOsc.ar(
		freq: [freqGen, freqGen + 1],
		mul: -10.dbamp
	);
}.play;

)



// Exercise 2a: Modulate width of VarSaw (saw => triangle => saw => ...)
// Exercise 2a complete.
// Just as an extra zero is required at the beginning of each array argument of Env.new() to use loopNode, an extra zero is required at the end to use releaseNode.
(

~synth = {
	var sig, env, envGen;

	env = Env.new(
		levels: [0, 0, 1, 0, 0],
		times: [0, 8, 8, 0],
		curve: [0, 0, 0, 0],
		releaseNode: 3,
		loopNode: 0
	);

	envGen = EnvGen.kr(env, doneAction: 0).poll;

	sig = VarSaw.ar(
		freq: 220,
		width: envGen,
		mul: -10.dbamp
	);
}.play;

)



// Exercise 2b: Instead of a smooth modulation of VarSaw Width, make it jump between 0.1 and 0.9 (linlin) to hear if there's any difference (I didn't hear any).
// Exercise 2b complete.

(

~synth = {
	var sig, widthGen;

	widthGen = LFPulse.kr(freq: 1/4).linlin(0, 1, 0.1, 0.9).poll;

	sig = VarSaw.ar(
		freq: 220,
		width: widthGen,
		mul: -10.dbamp
	);
}.play;

)



// Exercise 3: Apply sliding window to pitch cluster.  FIFO.
// TODO: Come back to this exercise after studying Patterns.

(

~synth = {
	var numFreqs;
	var freqs;
	var pattern;
	var sig;

	numFreqs = 2;
	freqs = Array.fill(numFreqs, {rrand(220, 440)});

	pattern = Pseq.new((0..numFreqs - 1).asArray, repeats: inf);

	sig = Mix(
		freqs.collect({
			arg freq;

			SinOsc.ar(freq, mul: -12.dbamp);
		})
	);
}.play;

)



// Exercise 4: Modulate frequency according to a sine wave.
// Exercise 4 complete.
(

~synth = {
	var freqGen;
	var sig;

	freqGen = SinOsc.kr(freq: 1/4, phase: -pi/2).range(220, 440).poll;

	sig = VarSaw.ar(freq: freqGen, width: MouseY.kr(0, 1));

	sig = sig * -24.dbamp;
}.play;

)



// Exercise 5: Random pitches inside a narrow pitch range but the pitch range moves according to an exponential curve.
// Exercise 5 complete.
// Sounds like a shaky voice.

(

~synth = {
	var pitchWindowSize;
	var pitchMinGen;
	var freqGen;
	var sig;

	pitchWindowSize = 10;

	pitchMinGen = EnvGen.kr(
		envelope: Env(
			levels: [0, 220, 880, 0],
			times: [0, 10, 0],
			curve: [0, 3, 0],
			releaseNode: 2,
			loopNode: 0
		),
		doneAction: 2
	);

	freqGen = LFNoise0.kr(freq: 22).range(lo: pitchMinGen, hi: pitchMinGen + pitchWindowSize);

	sig = SinOsc.ar(freq: freqGen);

	sig = sig * -6.dbamp;
}.play;

)



// Exercise 6: Import external audio that is slightly pitched.  Use .midiratio to transpose it to other notes.  Create a stream of random notes.
// TODO: Come back to this after learning more about Buffers and how to change PlayBuf rate argument once per loop.

(

b = Buffer.read(
	server: s,
	path: PathName(thisProcess.nowExecutingPath).parentPath +/+ "media" +/+ "Transportation Patrol Boat Honk Horn 02.wav"
);

~synth = {
	var bufRate;
	var sig;

	bufRate = BufRateScale.kr(b);

	sig = PlayBuf.ar(
		numChannels: 2,
		bufnum: b,
		rate: LFTri.kr(1/2).range(bufRate - 0.06 + (0.1 * b.bufnum), bufRate + 0.06 + (0.1 * b.bufnum)),
		loop: 1,
		doneAction: 2
	);

	sig = sig * -6.dbamp;
}.play;

)



// 8/19/24
// Exercise 7a: Create a stream of pitches.  Make the pitch random with probability p, and make the pitch fixed with probability (1 - p).
// Exercise 7b: Instead of fixing a pitch, play a short external audio.
// TODO

(

~synth = {
	var sig;

	sig = SinOsc.ar;

	sig = sig * -6.dbamp;
}.play;

)







// 8/22/24
// Exercise 8a: Loop the ending of Dixit Dominus.
// Exercise 8a complete.

(

~audioFilePath = PathName(thisProcess.nowExecutingPath).parentPath +/+ "media/music/Handel - Dixit Dominus - Gardiner.mp3";
~loopLength = 4.355;

b = Buffer.readChannel(server: s, path: ~audioFilePath, startFrame: 34.3215 * s.sampleRate, numFrames: ~loopLength * s.sampleRate);

)

(

~synth = {
	var rateGen;
	var sig;

	rateGen = EnvGen.kr(
		envelope: Env(
			levels: [0, 0.midiratio, 1.4.midiratio, 0.midiratio, 0],
			times: [0, ~loopLength, ~loopLength, 0],
			curve: [0, -4, -3, 0],
			releaseNode: 3,
			loopNode: 0
		),
		doneAction: 2
	);

	sig = PlayBuf.ar(
		numChannels: 2,
		bufnum: b,
		rate: rateGen,
		loop: 1,
		doneAction: 2,
	);

	sig = sig * -6.dbamp;
}.play;

)







// 8/22/24
// Exercise 8b: Loop the ending of Dixit Dominus, but with two voices: one at 1x speed and the other at 1.33x speed.
// TODO: For some reason, the looping isn't working.

Buffer.freeAll;

(

~audioFilePath = PathName(thisProcess.nowExecutingPath).parentPath +/+ "media/music/Handel - Dixit Dominus - Gardiner.mp3";
~loopLength = 4.6544;

~b1 = Buffer.readChannel(server: s, path: ~audioFilePath, startFrame: 34.3210 * s.sampleRate, numFrames: ~loopLength * s.sampleRate);
~b2 = Buffer.readChannel(server: s, path: ~audioFilePath, startFrame: 34.3210 * s.sampleRate, numFrames: ~loopLength * s.sampleRate);

)

(

~sig1 = {
	var sig;

	sig = PlayBuf.ar(
		numChannels: 2,
		bufnum: ~b1,
		rate: 1
		loop: 1,
		doneAction: 2,
	);

	sig = sig * -6.dbamp;
}.play;

~sig2 = {
	var sig;

	sig = PlayBuf.ar(
		numChannels: 2,
		bufnum: ~b2,
		rate: 4/3
		loop: 1,
		doneAction: 2,
	);

	sig = sig * -6.dbamp;
}.play;

)









// 8/23/24
// Exercise 8c: Modulate pitch of Dixit Dominus.
// Exercise 8c complete.

(

~audioFilePath = PathName(thisProcess.nowExecutingPath).parentPath +/+ "media/music/Handel - Dixit Dominus - Gardiner.mp3";
~loopLength = 303;

b = Buffer.readChannel(server: s, path: ~audioFilePath, startFrame: 1.5 * s.sampleRate, numFrames: ~loopLength * s.sampleRate);

)

(

~synth = {
	var rateGen;
	var sig;

	rateGen = EnvGen.kr(
		envelope: Env(
			levels: [0, -6.midiratio, 8.midiratio, 8.midiratio, 0],
			times: [0, LFTri.kr(5).range(0.5, 1.5), LF.kr(5).range(1, 7), 0],
			curve: [0, 0, -2, 0],
			releaseNode: 3,
			loopNode: 0
		),
		doneAction: 2
	);

	sig = PlayBuf.ar(
		numChannels: 2,
		bufnum: b,
		rate: rateGen,
		loop: 1,
		doneAction: 2,
	);

	sig = sig * -6.dbamp;
}.play;

)







// 8/23/24
// Exercise 9: Play with patterns.
// TODO

(

SynthDef(\synth1, {
	var ampEnv;
	var sig;

	ampEnv = EnvGen.kr(
		envelope: Env(
			levels: [1, 0],
			times: [0.2]
		),
		doneAction: 2,
	);

	sig = VarSaw.ar(
		freq: \freq.ir ! 2,
		width: 0.5
	);

	sig = sig * ampEnv * -18.dbamp;

	Out.ar(0, sig);
}).add;

n = 14;
~harmonics = (1..n) * 100;
~harmonicsWeights = ((n..1) * 3.3).normalizeSum;

~p1 = Pseq(list: ~harmonics, repeats: inf);
~p2 = Prand(list: ~harmonics, repeats: inf);
~p3 = Pxrand(list: ~harmonics, repeats: inf);
~p4 = Pwrand(list: ~harmonics, weights: ~harmonicsWeights, repeats: inf);
~p5 = Pshuf(list: ~harmonicsEveryOther, repeats: inf);

~p6 = Pseries(start: 300, step: 3, length: inf);
~p7 = Pgeom(start: 300, grow: 1.01, length: inf);
~p8 = Pwhite(lo: 300, hi: 333, length: inf);
~p9 = Pbrown(lo: 300, hi: 500, step: 5, length: inf);
~p10 = Pexprand();

Pbind(
	\instrument, \synth1,
	\freq, ~p9,
	\dur, 0.2,
	\sustain, 0.2
	).play;

)













// X/X/24
// Exercise X:
// TODO

(

~sig = {
	var sig;

	sig = SinOsc.ar;

	sig = sig * -6.dbamp;
}.play;

)







// X/X/24
// Exercise X:
// TODO

(

~sig = {
	var sig;

	sig = SinOsc.ar;

	sig = sig * -6.dbamp;
}.play;

)







// X/X/24
// Exercise X:
// TODO

(

~sig = {
	var sig;

	sig = SinOsc.ar;

	sig = sig * -6.dbamp;
}.play;

)







// X/X/24
// Exercise X:
// TODO

(

~sig = {
	var sig;

	sig = SinOsc.ar;

	sig = sig * -6.dbamp;
}.play;

)







// X/X/24
// Exercise X:
// TODO

(

~sig = {
	var sig;

	sig = SinOsc.ar;

	sig = sig * -6.dbamp;
}.play;

)







// X/X/24
// Exercise X:
// TODO

(

~sig = {
	var sig;

	sig = SinOsc.ar;

	sig = sig * -6.dbamp;
}.play;

)







