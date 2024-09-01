
// Control amplitude with envelopes

(
{
var env = Env.pairs([[0, 0], [0.4, 1], [1, 0.2], [1.1, 0.5], [2, 0]], \lin);
env.plot;
SinOsc.ar([440, 442], mul: env.kr(2));
}.play;
)



// Control frequencies with envelopes

(

{
	var freqEnv = Env.pairs([[0, 100], [0.4, 1000], [0.9, 400], [1.1, 555], [2, 440]], \lin);
	SinOsc.ar(freqEnv.kr, mul: 0.2);
}.play;

)


{Saw.ar(300)}.play;



// ASR and ADSR envelopes require the gate argument: 1 for 'open', 0 for 'close'
// Play note ('press key')
x = {
	arg gate = 1;
	SinOsc.ar(
		freq: 440,
		mul: Env.asr(attackTime: 0.5, sustainLevel: 1.0, releaseTime: 3).kr(doneAction: 2, gate: gate))
}.play;

x.set(\gate, 0);
x.release; // same as line above



// SynthDef and Synth

// Synth definition with SynthDef object
SynthDef("mySine1", {Out.ar(0, SinOsc.ar(770, 0, 0.1))}).add;
x = Synth("mySine1");
x.free;


// A slightly more flexible example using arguments and a self-terminating envelope (doneAction: 2)
SynthDef("mySine2", {
	arg freq = 440, amp = 0.1;
	var env = Env.perc(level: amp).kr(2);
	var snd = SinOsc.ar(freq, 0, env);
	Out.ar(0, snd);
}).add;

s.plotTree;

a = Array.fill(6, {Synth("wow", [\freq, rrand(40, 70).midicps, \amp, rrand(0.1, 0.5)])});

a[0].set(\gate, 0);
a[1].set(\gate, 0);
a[2].set(\gate, 0);
a[3].set(\gate, 0);
a[4].set(\gate, 0);
a[5].set(\gate, 0);

// ADVANCED: run 6-note chord again, then evaluate this line.
SystemClock.sched(0, {a[5.rand].set(\freq, rrand(40, 70.midicps); rrand(3, 10)});