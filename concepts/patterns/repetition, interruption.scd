/*



*/



// Exercise 1: Pclutch
// TODO

(

s.waitForBoot({

	SynthDef(\src, {
		var sig;

		sig = SinOsc.ar(mul: Env.linen(sustainTime: 0, releaseTime: 0.2).kr(doneAction: 2));

		Out.ar(0, sig);
	}).add;



	s.sync;



	Pbind(
		\instrument, \src,
	).play;

});

)



















// play repeated notes with a different rhythmic value per new pitch
// using Pdup

(

p = Pbind(
        // making 'n' a separate stream so that degree and dur can share it
    \n, Pwhite(3, 10, inf).trace,
    \degree, Pdup(Pkey(\n), Pwhite(-4, 11, inf)),
    \dur, Pdup(Pkey(\n), Pwhite(0.1, 0.4, inf)),
    \legato, 0.3
).play;

)



// using Pfin / Pn
// Pn loops the Pbind infinitely
// Plazy builds a new Pbind for each iteration
// Pfin cuts off the Pbind when it's time for a new value

(

p = Pn(
    Plazy {
        Pbind(
            \degree, Pfin(rrand(3, 10), rrand(-4, 11)),
            \dur, rrand(0.1, 0.4)
        )
    },
    inf
).play;

)



// using Pclutch
// the rule is, when degree changes, dur should change also
// if Pdiff returns 0, degree has not changed
// so here, nonzero Pdiff values "connect" the clutch and allow a new dur to be generated
// otherwise the old one is held

(

p = Pbind(
    \degree, Pdup(Pwhite(3, 10, inf), Pwhite(-4, 11, inf)),
    \dur, Pclutch(Pwhite(0.1, 0.4, inf), Pdiff(Pkey(\degree)).abs > 0),
    \legato, 0.3
).play;

)