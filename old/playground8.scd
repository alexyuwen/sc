s.plotTree;

w = {SinOsc.ar(60.midicps, 0, 0.1)}.play;
x = {SinOsc.ar(64.midicps, 0, 0.1)}.play;

(

{WhiteNoise.ar(Line.kr(0.2, 0, 2, doneAction: 2))}.play;

)

Env.perc.plot;
Env.perc(0.5).plot;
Env.perc(attackTime: 0.3, releaseTime: 2, level: 0.4).plot;
Env.perc(0.3, 2, 0.4, 0).plot;

{PinkNoise.ar(Env.perc.kr(2))}.play;
{PinkNoise.ar(Env.perc(0.3, 2, 0.4, 0).kr(2))}.play;



s.plotTree;

(
{
x = Env.triangle(4).kr(2);
PinkNoise.ar(x);
}.play;
)

{SinOsc.ar([440, 442]) * Env.triangle(5, 1).kr(2)}.play;

Env.linen(attackTime: 0.01, sustainTime: 2, releaseTime: 1, level: 0.2).plot;
Env.perc(attackTime: 0.01, releaseTime: 1, level: 0.2, curve: 0).plot;