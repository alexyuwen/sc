/*

/////////
NOTES
/////////

-

*/



(

Pbind(
	\sustain, 8,
	\dur, (Pkey(\sustain) / 20).trace,
	\freq, Pexprand(lo: 250, hi: 1000, length: inf)
).play;

)