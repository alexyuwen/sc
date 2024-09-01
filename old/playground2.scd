/*

QUESTIONS

- What is the default control rate?
  - 44100 / 64 = 689 Hz, where 64 is the 'control period'
- X




NOTES

- sound signals vs control signals
-

*/

{SinOsc.ar(freq: MouseX.kr(300, 2500), mul: MouseY.kr(0, 1))}.play;

(

s = {Pulse.ar(415.3, 0.5)}; // What does the second parameter of 'ar' do?  It's phase, but how does that change the timbre?
s.play;

)

(

a = Pulse();
b = a.ar;
a.postln;
b.postln;

)

{SinOsc.ar(1).poll}.play;
{LFPulse.ar(1).poll}.play;

{LFNoise0.ar(1).poll}.play

{SinOsc.ar(freq: LFNoise0.kr(10).range(500, 1500), mul: 0.5)}.play;