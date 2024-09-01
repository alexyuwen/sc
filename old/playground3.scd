{LFNoise0.kr().poll(trig: 100)}.play;

// Stream of random pitches
// TODO: test linexp
a = {Pulse.ar(freq: LFNoise0.kr(5).linexp(-1, 1, 200, 1600), mul: 0.5)}.play;

a.free;

a.set(\freq, 440);

x = {arg freq = 440, amp = 0.2; SinOsc.ar(freq, 0, amp)}.play;
x.set(\freq, 778);


{Out.ar(0, SinOsc.ar(440, 0, 0.1))}.play;

{SoundIn.ar(0)}


{SinOsc.ar(freq: 440)}.play;