// Parameterize frequency of audio sample

(

b = Buffer.read(s, "C:/sc/media/Weapon Bow And Arrow Thump 01.wav");

{PitchShift.ar(in: PlayBuf.ar(2, b, loop: 1), windowSize: 0.05, pitchRatio: MouseX.kr(0.4, 4).poll)}.play;

)