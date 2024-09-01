// There are 128 buses, but only buses 16 to 127 are available because buses 0 to 15 are reserved for sound card outputs and inputs.



// Create the bus
~bus = Bus.audio(s, 2);

// Turn on the reverb: read from bus (source sound)
r = {Out.ar(0, FreeVerb.ar(In.ar(~bus, 2), mix: 0.5, room: 0.9, mul: 0.4))}.play;

// Feed the tone into bus
b = {Out.ar(~bus, SinOsc.ar([800, 880], mul: LFPulse.ar(2)))}.play;

// Free both synths
r.free; b.free;





// Panning
p = {Pan2.ar(in: PinkNoise.ar, pos: SinOsc.kr(2), level: 0.1)}.play;