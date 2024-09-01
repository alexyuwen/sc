// Panning
{Pan2.ar(in: PinkNoise.ar, pos: SinOsc.kr(2), level: 0.1)}.play;

(

// Complicated example
x = {
	var lfn = LFNoise2.kr(1);
	var saw = Saw.ar(
		freq: 30,
		mul: LFPulse.kr(
			freq: LFNoise1.kr(1).range(1, 10),
			width: 0.1));
	var bpf = BPF.ar(
		in: saw,
		freq: lfn.range(500, 2500),
		rq: 0.01,
		mul: 20);
	Pan2.ar(in: bpf, pos: lfn);
}.play;

)

{LFPulse.kr(1, width: 0.1).range(1, 10).poll}.play;





(

{

var baseFreq = LFNoise0.kr(10).range(200, 2000);
var notes = SinOsc.ar(
	freq: [baseFreq, baseFreq + 10],
	mul: 0.1);

var notesFiltered = BPF.ar(in: notes, freq: 1000, rq: 0.1);

Out.ar(0, notesFiltered);

}.play;

)



(

// Mix and Splay
a = {SinOsc.ar([100, 300, 500, 700, 900], mul: 0.1)}.play;

b = {Mix(SinOsc.ar([100, 300, 500, 700, 900], mul: 0.1))}.play;

c = {Splay.ar(SinOsc.ar([100, 300, 500, 700, 900], mul: 0.1))}.play;

d = {arg fundamental = 110;
	var harmonics = [1, 2, 3, 4, 5, 6, 7, 8, 9];
	var snd = BPF.ar(
		in: Saw.ar(32, LFPulse.ar(harmonics, width: 0.1)),
		freq: harmonics * fundamental,
		rq: 0.01,
		mul: 20);
	Splay.ar(snd);
}.play;

)

d.set(\fundamental, 160);









(

b = Buffer.read(s, "C:/sc/media/Weapon Arrow Shot 01.wav");

{PlayBuf.ar(2, b, loop: 1) * 0.2}.play;
{SinOsc.ar(freq: Line.kr(200, 2000, 30), mul: 0.1)}.play;

)