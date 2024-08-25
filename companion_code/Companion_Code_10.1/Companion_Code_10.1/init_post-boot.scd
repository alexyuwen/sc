// Companion Code 10.1: Post-Boot Setup
// An Event-Based Composition

// This sub-file handles initialization tasks meant to occur after the server has booted and other server-related tasks are complete. Populating the server with Synths and Groups is perhaps the most likely action to occur here.

// Both ~srcGroup and ~grainGroup are created for the purpose of containing source Synths. The difference is that ~grainGroup will be exclusively used to contain granular Synths, to facilitate addressing multiple granular Synths with a single Group message, and without influencing other non-granular Synths (which will be placed in ~srcGroup instead).

~makeNodes = {
	~srcGroup = Group();
	~grainGroup = Group.after(~srcGroup);
	~fxGroup = Group.after(~grainGroup);
	~reverb = Synth(\reverb, [in: ~fxBus, mix: 0.1], ~fxGroup);
};

ServerTree.add(~makeNodes);
ServerTree.run;