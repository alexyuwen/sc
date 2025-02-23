///////////////////////////////////////////////////
// History, as it was on Thu Aug  4 22:01:52 2022.
///////////////////////////////////////////////////

// - 0:0:0.0 -  
s.options.memSize_(2.pow(20));

// - 0:0:6.32 -  
p = ProxySpace.new(s.boot).push;

// - 0:0:20.97 -  
~pad.fadeTime_(8).play;

// - 0:0:43.06 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, 78.midicps, 0.005, 10);
	sig = sig * 0.02!2
}
)

// - 0:0:54.52 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,78].midicps, 0.005, 10);
	sig = sig * 0.02
}
)

// - 0:0:58.6 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,76].midicps, 0.005, 10);
	sig = sig * 0.02
}
)

// - 0:1:0.62 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,76].midicps, 0.005, 10);
	sig = sig * 0.03
}
)

// - 0:1:7.28 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,78].midicps, 0.005, 10);
	sig = sig * 0.03
}
)

// - 0:1:14.88 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,66,78].midicps, 0.005, 10);
	sig = sig * 0.04
}
)

// - 0:1:23.58 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,66,78].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.05;
}
)

// - 0:1:29.18 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,66,76].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.05;
}
)

// - 0:1:33.12 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [56,66,76].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.05;
}
)

// - 0:1:40.05 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,66,78].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.08;
}
)

// - 0:1:46.76 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,78,80].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.08;
}
)

// - 0:1:52.31 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,78,80,83].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.08;
}
)

// - 0:1:59.07 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,78,80,82,83].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.08;
}
)

// - 0:2:6.76 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.1;
}
)

// - 0:2:12.59 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.1;
}
)

// - 0:2:18.38 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,66,80,82,83,85].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.12;
}
)

// - 0:2:29.52 -  
~blip.fadeTime_(3).play;

// - 0:3:16.58 -  
(
~blip = {
	var sig, trig;
	trig = Impulse.kr(0.1);
	sig = SinOsc.ar(78.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01!2;
}
)

// - 0:3:24.58 -  
(
~blip = {
	var sig, trig;
	trig = Impulse.kr(0.1);
	sig = SinOsc.ar(78.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)

// - 0:3:28.32 -  
(
~blip = {
	var sig, trig;
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(78.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)

// - 0:3:32.42 -  
(
~blip = {
	var sig, trig;
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(78.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.03!2;
}
)

// - 0:3:36.19 -  
(
~blip = {
	var sig, trig;
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(78.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)

// - 0:3:59.63 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78];
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(notes.midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)

// - 0:4:27.52 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78];
	trig = Impulse.kr(0.3);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)

// - 0:4:37.98 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,82,83,85];
	trig = Impulse.kr(0.3);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)

// - 0:4:53.76 -  
~fx.fadeTime_(8).play;

// - 0:5:29.93 -  
(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.05);
	sig = GVerb.ar(sig.sum, 300, 5);
}
)

// - 0:5:43.2 -  
(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.1);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:5:47.36 -  
~fx.fadeTime_(5).play;

// - 0:5:53.35 -  
(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.2);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:5:59.22 -  
(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.3);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:6:23.04 -  
(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.3);
	sig = sig.blend(CombL.ar(sig, 0.5, 0.3, 4), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:6:32.02 -  
(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.3);
	sig = sig.blend(CombL.ar(sig, 0.5, 0.3, 4), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:6:40.94 -  
(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.3);
	sig = sig.blend(CombL.ar(sig, 0.5, 0.3, 6), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:6:43.98 -  
(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.3);
	sig = sig.blend(CombL.ar(sig, 0.5, 0.3, 8), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:6:47.41 -  
(
~fx = {
	var sig;
	sig = (~blip.ar(2) * 0.4);
	sig = sig.blend(CombL.ar(sig, 0.5, 0.3, 8), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:7:7.61 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.1).exprange(0.3, 0.45);
	sig = (~blip.ar(2) * 0.4);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:7:20.96 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.4);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.75);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:7:24.26 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,82,83,85];
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)

// - 0:7:33.13 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:7:36.49 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [66,66,80,82,83,85,87].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.12;
}
)

// - 0:7:39.86 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,66,66,80,82,83,85,87].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.12;
}
)

// - 0:7:43.31 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.12;
}
)

// - 0:7:46.72 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.16;
}
)

// - 0:7:54.61 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.005, 10);
	sig = Splay.ar(sig) * 0.16;
}
)

// - 0:8:1.54 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = Splay.ar(sig) * 0.16;
}
)

// - 0:8:14.2 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 2);
	sig = Splay.ar(sig) * 0.16;
}
)

// - 0:8:20.04 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 4);
	sig = Splay.ar(sig) * 0.16;
}
)

// - 0:8:24.3 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 4);
	sig = Splay.ar(sig) * 0.12;
}
)

// - 0:8:29.39 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 10);
	sig = Splay.ar(sig) * 0.07;
}
)

// - 0:8:35.24 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 10);
	sig = Splay.ar(sig) * 0.03;
}
)

// - 0:8:40.65 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [54,54,66,66,80,82,83,85,87,88].midicps, 0.003, 10);
	sig = tanh(sig * 8);
	sig = Splay.ar(sig) * 0.04;
}
)

// - 0:8:55.25 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig + (~pad.ar(2) * 0.2);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:9:3.63 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig + (~pad.ar(2) * 0.15);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:9:16.94 -  
~saw.fadeTime_(8).play;

// - 0:10:4.36 -  
(
~saw = {
	var sig, freq;
	freq = 30.midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = RLPF.ar(sig, 1000, 0.25, 0.01);
	sig!2;
}
)

// - 0:10:9.79 -  
(
~saw = {
	var sig, freq;
	freq = 30.midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = RLPF.ar(sig, 1000, 0.25, 0.01);
}
)

// - 0:10:20.2 -  
(
~saw = {
	var sig, freq;
	freq = 30.midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = RLPF.ar(sig, 500, 0.15, 0.01);
}
)

// - 0:10:25.43 -  
(
~saw = {
	var sig, freq;
	freq = 30.midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = RLPF.ar(sig, 500, 0.15, 0.015);
}
)

// - 0:10:39.72 -  
(
~saw = {
	var sig, freq;
	freq = 30.midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 500, 0.15, 0.015);
}
)

// - 0:10:54.64 -  
(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 500, 0.15, 0.01);
}
)

// - 0:11:2.48 -  
(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 1000, 0.15, 0.01);
}
)

// - 0:11:12.27 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,82,83,85,94,94];
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)

// - 0:11:19.54 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94];
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02!2;
}
)

// - 0:11:31.92 -  
(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 1500, 0.15, 0.01);
}
)

// - 0:11:36.08 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 1500, 0.15, 0.01);
}
)

// - 0:11:39.33 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94];
	trig = Impulse.kr(0.2);
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01!2;
}
)

// - 0:11:55.15 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94];
	trig = Impulse.kr(LFNoise1.kr(0.1).exprange(0.2, 0.8));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01!2;
}
)

// - 0:12:7.61 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).exprange(0.2, 0.8));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01;
}
)

// - 0:12:21.1 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 2000, 0.15, 0.01);
}
)

// - 0:12:25.18 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 2000, 0.15, 0.01);
}
)

// - 0:12:32.2 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = RLPF.ar(sig, 2500, 0.3, 0.01);
}
)

// - 0:13:3.6 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(2, [0,0.5]).range(0.4,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.01);
}
)

// - 0:13:12.83 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(4, [0,0.5]).range(0.4,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.01);
}
)

// - 0:13:19.87 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(4, [0,0.5], 0.3).range(0.4,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.01);
}
)

// - 0:13:26.76 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.3, 0.01);
}
)

// - 0:13:29.93 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.3, 0.02);
}
)

// - 0:13:32.86 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 1500, 0.3, 0.02);
}
)

// - 0:13:41.76 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,66].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 1500, 0.3, 0.02);
}
)

// - 0:13:49.54 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,66].midicps;
	sig = Saw.ar(freq + [0,0.3,0.7]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.02);
}
)

// - 0:13:53.53 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,66].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.02);
}
)

// - 0:13:58.76 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.02);
}
)

// - 0:14:5.32 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)

// - 0:14:9.12 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)

// - 0:14:13.37 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,80].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.5], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)

// - 0:14:19.98 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,80].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)

// - 0:14:25.95 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,76].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)

// - 0:14:31.66 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)

// - 0:14:39.4 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)

// - 0:14:43.41 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,90].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)

// - 0:14:48.05 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,90].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)

// - 0:14:57.24 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,88].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)

// - 0:15:3.74 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,87].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)

// - 0:15:9.53 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,83,87].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)

// - 0:15:16.15 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78,82,83].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)

// - 0:15:22.03 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 3500, 0.5, 0.03);
}
)

// - 0:15:26.27 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(6, [0,0.1], 0.3).range(0.4,1), 0.75);
	sig = RLPF.ar(sig, 1500, 0.5, 0.03);
}
)

// - 0:15:45.24 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1000, 0.5, 0.03);
}
)

// - 0:15:52.22 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,76].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1000, 0.5, 0.03);
}
)

// - 0:15:56.93 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1000, 0.5, 0.03);
}
)

// - 0:16:9.18 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig + (~pad.ar(2) * 0.15);
	sig = sig + (~saw.ar(2) * 0.05);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:16:14.93 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).exprange(0.1, 0.3));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01;
}
)

// - 0:16:20.4 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).exprange(0.1, 0.3));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01;
}
)

// - 0:16:29.53 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).exprange(0.1, 0.3));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * 2);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.01;
}
)

// - 0:16:31.69 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).exprange(0.1, 0.3));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * 2);
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)

// - 0:16:45.26 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).range(0.1, 0.5));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * 2) * 0.5;
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)

// - 0:16:59.71 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).range(0.1, 0.5));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * LFNoise1.kr(0.2).exprange(0.7,4)) * 0.5;
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)

// - 0:17:9.55 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 8);
	sig = Splay.ar(sig) * 0.04;
}
)

// - 0:17:12.96 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 12);
	sig = Splay.ar(sig) * 0.04;
}
)

// - 0:17:27.47 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 12);
	sig = sig * LFPulse.ar(6).range(0.4, 1);
	sig = Splay.ar(sig) * 0.04;
}
)

// - 0:17:42.61 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 12);
	sig = sig * LFPulse.ar(6).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.04;
}
)

// - 0:17:50.6 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 12);
	sig = sig * LFPulse.ar(6).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)

// - 0:17:54.46 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig + (~pad.ar(2) * 0.15);
	sig = sig + (~saw.ar(2) * 0.1);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:18:1.43 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1000, 0.5, 0.03);
}
)

// - 0:18:5.03 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1500, 0.5, 0.03);
}
)

// - 0:18:10.85 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1500, 0.5, 0.03);
}
)

// - 0:18:13.94 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 1500, 0.5, 0.03);
}
)

// - 0:18:17.05 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.5, 0.03);
}
)

// - 0:18:25.01 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar(8, width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.03);
}
)

// - 0:18:32.34 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([8,11], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.03);
}
)

// - 0:18:39.89 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([12,11], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.03);
}
)

// - 0:18:47.24 -  
(
~saw = {
	var sig, freq;
	freq = [30,42,66,75,76,78,80,82].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([12,15], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.03);
}
)

// - 0:18:51.52 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,75,76,78,80,82].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([12,15], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2500, 0.3, 0.03);
}
)

// - 0:18:58.68 -  
(
~blip = {
	var sig, trig, notes;
	notes = [66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).range(0.1, 0.5));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * LFNoise1.kr(0.2).exprange(0.5,10)) * 0.5;
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)

// - 0:19:8.07 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 12);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)

// - 0:19:15.54 -  
(
~blip = {
	var sig, trig, notes;
	notes = [30,30,66,78,80,85,94,94,95,97,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).range(0.1, 0.5));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * LFNoise1.kr(0.2).exprange(0.5,10)) * 0.5;
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)

// - 0:19:22.31 -  
(
~blip = {
	var sig, trig, notes;
	notes = [30,30,66,78,80,85,94,99];
	trig = Impulse.kr(LFNoise1.kr(0.1!2).range(0.1, 0.5));
	sig = SinOsc.ar(TChoose.kr(trig, notes).midicps);
	sig = tanh(sig * LFNoise1.kr(0.2).exprange(0.5,10)) * 0.5;
	sig = sig * Env.perc(0.002, 6, 1, -30).ar(0, trig);
	sig = sig * 0.02;
}
)

// - 0:19:31.99 -  
~brn.fadeTime_(5).play;

// - 0:19:42.8 -  
~brn = {BrownNoise.ar(0.005!2)}

// - 0:20:0.14 -  
~brn = {RLPF.ar(BrownNoise.ar(0.005!2), 100, 0.3)}

// - 0:20:6.44 -  
~brn = {RLPF.ar(BrownNoise.ar(0.01!2), 100, 0.3)}

// - 0:20:10.13 -  
~brn = {RLPF.ar(BrownNoise.ar(0.01!2), 150, 0.3)}

// - 0:20:19.78 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,75,76,78,80,82].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([18,20], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 3000, 0.3, 0.02);
}
)

// - 0:20:24.9 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 7);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)

// - 0:20:28.63 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.35);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.1);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:20:35.5 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.15);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 8), 0.5);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:20:44.28 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.2);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.3);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:20:56.94 -  
~brn = {RLPF.ar(BrownNoise.ar(0.02!2), 200, 0.3)}

// - 0:21:8.46 -  
~brn = {RLPF.ar(BrownNoise.ar(0.025!2), 150, 0.2)}

// - 0:21:15.58 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,94].midicps, 0.003, 10);
	sig = tanh(sig * 3);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)

// - 0:21:26.31 -  
~saw.fadeTime_(4).play;

// - 0:21:27.22 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,75,76,78,80,82].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([14,16], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 3000, 0.3, 0.02);
}
)

// - 0:21:34.31 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,75,76,78,80,82].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([10,9], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 3000, 0.3, 0.02);
}
)

// - 0:21:42.05 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,66,75,76,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([10,9], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2000, 0.3, 0.02);
}
)

// - 0:21:48.57 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([10,9], width:0.3).range(0.2,1), 0.6);
	sig = RLPF.ar(sig, 2000, 0.3, 0.02);
}
)

// - 0:21:56.23 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.2);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5), 2000);
}
)

// - 0:22:5.12 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.2);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)

// - 0:22:16.95 -  
~blip.clear(30);

// - 0:22:26.13 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([7,6], width:0.3).range(0.4,1), 0.6);
	sig = RLPF.ar(sig, 2000, 0.3, 0.02);
}
)

// - 0:22:30.12 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([7,6], width:0.3).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 2000, 0.3, 0.02);
}
)

// - 0:22:36.48 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([7,6], width:0.3).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1600, 0.2, 0.02);
}
)

// - 0:22:41.77 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([7,6], width:0.3).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)

// - 0:22:49.49 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.3).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)

// - 0:22:52.46 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,75,78].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)

// - 0:22:59.41 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,74,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)

// - 0:23:2.14 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.1, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.1);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)

// - 0:23:6.39 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.25);
	sig = sig + (~saw.ar(2) * 0.1);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)

// - 0:23:8.92 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,73,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)

// - 0:23:18.16 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,71,75].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)

// - 0:23:21.19 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,71,73].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([4,4.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)

// - 0:23:28.84 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,70,73].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)

// - 0:23:33.44 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66,70,71].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)

// - 0:23:38.62 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 1200, 0.2, 0.03);
}
)

// - 0:23:46.07 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54,66].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 800, 0.1, 0.03);
}
)

// - 0:23:57.32 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 700, 0.1, 0.03);
}
)

// - 0:24:6.99 -  
~brn = {RLPF.ar(BrownNoise.ar(0.03!2), 180, 0.2)}

// - 0:24:14.23 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,92].midicps, 0.003, 10);
	sig = tanh(sig * 3);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)

// - 0:24:25.36 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,92].midicps, 0.003, 10);
	sig = tanh(sig * 2);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.4, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.08;
}
)

// - 0:24:29.82 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 600, 0.1, 0.03);
}
)

// - 0:24:36.33 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([2,2.5], width:0.6).range(0.4,1), 0.5);
	sig = RLPF.ar(sig, 600, 0.3, 0.05);
}
)

// - 0:24:46.25 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 600, 0.3, 0.05);
}
)

// - 0:24:51.17 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42,54].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 500, 0.3, 0.05);
}
)

// - 0:24:57.33 -  
(
~saw = {
	var sig, freq;
	freq = [18,30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 500, 0.3, 0.05);
}
)

// - 0:25:0.93 -  
(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 500, 0.3, 0.05);
}
)

// - 0:25:5.39 -  
~brn = {RLPF.ar(BrownNoise.ar(0.02!2), 180, 0.2)}

// - 0:25:11.53 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [80,82,83,85,87,88,92].midicps, 0.003, 10);
	sig = tanh(sig * 2);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.8, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)

// - 0:25:24.97 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [78,82,83,90].midicps, 0.003, 10);
	sig = tanh(sig * 2);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.8, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.05;
}
)

// - 0:25:31.46 -  
(
~pad = {
	var sig;
	sig = PinkNoise.ar(1);
	sig = BPF.ar(sig, [78,82,83,90].midicps, 0.003, 10);
	sig = tanh(sig * 2);
	sig = sig * LFPulse.ar(1, [0,0.5]).range(0.8, 1).lag(0.02);
	sig = Splay.ar(sig) * 0.1;
}
)

// - 0:25:39.7 -  
~brn = {RLPF.ar(BrownNoise.ar(0.015!2), 180, 0.3)}

// - 0:25:45.59 -  
(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 500, 0.3, 0.025);
}
)

// - 0:25:49.96 -  
(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 400, 0.3, 0.025);
}
)

// - 0:26:1.93 -  
~pad.stop(15);

// - 0:26:7.49 -  
(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([1,1.2], width:0.6).range(0.2,1), 0.7);
	sig = RLPF.ar(sig, 300, 0.3, 0.025);
}
)

// - 0:26:23.44 -  
(
~saw = {
	var sig, freq;
	freq = [30,42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([0.4,0.5], width:0.6).range(0.5,1), 0.7);
	sig = RLPF.ar(sig, 200, 0.2, 0.025);
}
)

// - 0:26:29.79 -  
(
~saw = {
	var sig, freq;
	freq = [42].midicps;
	sig = Saw.ar(freq + [0,0.3]);
	sig = Splay.ar(sig);
	sig = sig.blend(sig * LFPulse.ar([0.4,0.5], width:0.6).range(0.5,1), 0.7);
	sig = RLPF.ar(sig, 200, 0.2, 0.025);
}
)

// - 0:26:38.25 -  
~saw.stop(15);

// - 0:26:48.52 -  
~brn = {RLPF.ar(BrownNoise.ar(0.01!2), 120, 0.3)}

// - 0:26:53.99 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.15);
	sig = sig + (~saw.ar(2) * 0.05);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)

// - 0:27:0.02 -  
~fx.fadeTime_(10).play;

// - 0:27:4.0 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.1);
	sig = sig + (~saw.ar(2) * 0.03);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)

// - 0:27:10.7 -  
~brn = {RLPF.ar(BrownNoise.ar(0.005!2), 120, 0.3)}

// - 0:27:17.33 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.03);
	sig = sig + (~saw.ar(2) * 0.015);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)

// - 0:27:21.87 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.02);
	sig = sig + (~saw.ar(2) * 0.01);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)

// - 0:27:24.87 -  
~brn = {RLPF.ar(BrownNoise.ar(0.002!2), 120, 0.3)}

// - 0:27:30.03 -  
(
~fx = {
	var sig, del;
	del = LFNoise1.kr(0.02).exprange(0.3, 0.4);
	sig = (~blip.ar(2) * 0.2);
	sig = sig + (~pad.ar(2) * 0.0);
	sig = sig + (~saw.ar(2) * 0.0);
	sig = sig.blend(CombL.ar(sig, 0.5, del, 20), 0.6);
	sig = LPF.ar(GVerb.ar(sig.sum, 300, 5)*1.5, 1000);
}
)

// - 0:27:36.68 -  
~brn.clear(6);

// - 0:27:48.43 -  
p.clear;

// - 0:27:50.88 -  
p.pop;

// - 0:27:52.53 -  
s.quit;

