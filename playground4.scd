{Saw.ar(freq: 440, mul: 0.1)}.play;

{Pulse.kr(10)}.plot(duration: 1.5);

(

// TODO: Does this work without earbuds?
{Out.ar(bus: LFPulse.kr(44), channelsArray: SinOsc.ar(freq: 40, mul: 0.1))}.play;

)



f = {Out.ar(0, BPF.ar(in: In.ar(55), freq: MouseY.kr(1000, 5000), rq: 0.1))}.play;
n = {Out.ar(55, WhiteNoise.ar(0.5))}.play;

// microphone input
{SoundIn.ar(0)}.play;

{FreeVerb.ar(SoundIn.ar([0, 1]), mix: 0.5, room: 0.9)}.play;

{Out.ar(0, Saw.ar(freq: [440, 570], mul: Line.kr(0, 0.1, 1)))}.play;

// Multichannel expansion
a = {Out.ar(0, SinOsc.ar(freq: [800, 880], mul: LFPulse.ar([2])))}.play;

// bandpass filter and bus redirect
// start the effect
f = {Out.ar(0, BPF.ar(in: In.ar(55), freq: MouseY.kr(1000, 5000), rq: 0.1))}.play;
// start the source
n = {Out.ar(55, WhiteNoise.ar(0.5))}.play;



r = {Out.ar(0, FreeVerb.ar(In.ar(55, 2), mix: 0.5, room: 0.9, mul: 0.4))}.play;
a = {Out.ar(55, SinOsc.ar([800, 880], mul: LFPulse.ar(2)))}.play;