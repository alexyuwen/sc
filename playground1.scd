/*

Thoughts on the language

- CTRL + . stops everything; how can I stop just one line?

*/

{SinOsc.ar}.play;




(

Pbind(
	\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 5),
	\dur, Pseq([0.4, 0.2, 0.2, 0.4, 0.4, 0.7], inf),
	\amp, Pseq([0.7, 0.5, 0.3, 0.2], inf),
	\legato, 0.4
).play;

)

2.postln;

[2, 3, 4, 5] << nl;

(

Pbind(
	\freq, Pwhite(100.0, 500),
	\dur, Prand([0.3], inf),
	\amp, 0.2,
	\legato, 0.3
	).trace.play;

)

(

Pbind(
	\note, Pser([9, 2, 3, 5, 7, 8, 11, 12], 11),
	\dur, 0.15;
).trace.play;

)

(

p = Pbind(
	\note, Pxrand([0, 2, 3, 5, 7, 8, 11, 12], inf),
	\dur, 0.15;
).trace.play;

)

(

p = Pbind(
	\note, Pshuf([0, 2, 3, 5, 7, 8, 11, 12], 6),
	\dur, 0.15;
).trace.play;

)

(

Pbind(
	\note, Pslide([0, 2, 3, 5, 7, 8, 11, 12], 7, 3, 1),
	\dur, 0.15;
).trace.play;

)

(

Pbind(
	\note, Pseries(0, 2, 15),
	\dur, 0.15;
).trace.play;

)

(

Pbind(
	\note, Pseq([0, 2, 3, 5, 7, 8, 11, 12], inf),
	\dur, Pgeom(0.1, 2, 25);
).trace.play;

)

(

Pbind(
	\note, Pseq([0, Pn(2, 3), 3, Pn(5, 3), 7, Pn(8, 3), 11, 12], 1),
	\dur, 0.15;
).trace.play;

)

(

Pbind(
	\note, Pseq([[0, 3, 7], [2, 5, 8], [3, 7, 10], [5, 8, 12]], 3),
	\dur, 0.15
).trace.play;

)

(

Pbind(
	\note, Pseq([[-7, 3, 7, 10], [0, 3, 5, 8]], 2),
	\dur, 1,
	\legato, 0.4,
	\strum, 0.04
).trace.play;

)

Scale.directory;

(

Pbind(
	\degree, Pseq([0, 1, 2, 3, 3.1, 4], 1),
	\ctranspose, 12
).trace.play;

)

(

Pbind(
	\note, Pseq([0, 0.5, 1, 1.5, 1.75, 2], 1)
).trace.play(TempoClock(120/60));

)

(

Pbind(
	\dur, Pseq([0.2, Rest(0.2), 0.2, 0.2], inf)
).trace.play;

)

// Basic fork example. Watch Post window:
(
{
"one thing".postln;
2.wait;
"another thing".postln;
1.5.wait;
"one last thing".postln;
}.fork();
)

// A more interesting example:
(

t = TempoClock(76/60);
{
p = Pbind(
\note, Pseq([[4, 11], [6, 9]], 32),
\dur, 1/6,
\amp, Pseq([0.05, 0.03], inf)
).play(t);
2.wait;
Pbind(
\note, Pseq([[−25, −13, −1], [−20, −8, 4], \rest], 3),
\dur, Pseq([1, 1, Rest(1)], inf),
\amp, 0.1,
\legato, Pseq([0.4, 0.7, \rest], inf)
);

~player = p.play(t);
~player.stop;

2.75.wait;

Pbind(
\note, Pseq([23, 21, 25, 23, 21, 20, 18, 16, 20, 21, 23, 21], inf),
\dur, Pseq([0.25, 0.75, 0.25, 1.75, 0.125, 0.125, 0.80, 0.20, 0.125, 0.125, 1], 1),
\amp, 0.1,
\legato, 0.5
).play(t);
}.fork(t);

)

(

{

p = Pbind(
	\note, Pseq([7, 4, 0.9, 0], 4),
	\dur, Pseq([0.5, 0.5, 1, 1], inf),
	\amp, Pseq([0.5, 0.4, 0.33, 0.3], inf)
);

~player = p.play;
1.wait;
~player.stop;
~player.resume;
~player.reset;

}.fork;

)

(

p = Array.fill(3, 1);
p = 1.dup(3);
p = dup(1, 3);
p = 1!3;
p + 10;

(50..79);
series(50, 53, 79);
(50, 53..79);

)