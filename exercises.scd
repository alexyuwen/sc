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
// ON HOLD: Come back to this exercise after studying Patterns.

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



// Exercise 4:

s.quit;