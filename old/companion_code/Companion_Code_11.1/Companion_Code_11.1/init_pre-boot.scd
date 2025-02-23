// Companion Code 11.1: Pre-Boot Setup
// A State-Based Composition - An Automated Markov Chain Approach

// This sub-file handles initialization tasks meant to take place before the server is booted. This code allocates an audio bus for a reverb effect, defines and performs a cleanup function, and also registers the cleanup function with ServerQuit. More complex compositions may include additional code here, such as defining other environment variables (e.g. global values, functions, pitch collections), creating one or more TempoClock objects, or configuring the server's settings via ServerOptions (e.g. setting the sample rate, the audio hardware device, or the number of output bus channels).

s.newBusAllocators;
~fxBus = Bus.audio(s, 2);

~cleanup = {
	s.freeAll;
	ServerBoot.removeAll;
	ServerTree.removeAll;
	ServerQuit.removeAll;
};

~cleanup.();
ServerQuit.add(~cleanup);