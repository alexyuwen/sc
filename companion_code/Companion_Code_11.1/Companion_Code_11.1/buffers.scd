// Companion Code 11.1: Buffers
// A State-Based Composition - An Automated Markov Chain Approach

// This sub-file defines and calls the buffer-loading function ~makeBuffers, which organizes audio files into an Event. This function is first introduced in Companion Code 4.1. Because this project uses GrainBuf (which can only interact with one-channel buffers), the function has been modified with a third argument named 'mono'. When mono is true, only one channel of audio is loaded for each audio file. If false, files are loaded into buffers according to their original channel format.

// There are no differences between this file and the corresponding file in Companion Code 10.1, and both compositions use the same collection of samples.

~makeBuffers = { |path, event, mono = false|
	var dir = PathName.new(path);
	var contents = dir.entries;

	if (contents.select({ |n| n.isFile }).size > 0)
	{
		var files, bufArray;
		files = contents.select({ |n| n.isFile });
		files = files.select({ |n|
			["aif", "aiff", "wav"].includesEqual(n.extension)
		});

		if (event[dir.folderName.asSymbol] != nil)
		{ "duplicate subfolder name ignored".warn; }
		{
			bufArray = files.collect({ |n|
				if(mono) {
					Buffer.readChannel(s, n.fullPath, channels: [0]) // mono if true
				} {
					Buffer.read(s, n.fullPath) // original channel format if false
				}
			});
			event[dir.folderName.asSymbol] = bufArray;
		};
	};

	if (contents.select({ |n| n.isFolder }).size > 0)
	{
		var folders = contents.select({ |n| n.isFolder });
		folders.do({ |n| ~makeBuffers.(n.fullPath, event, mono) });
	};

	event;
};

~b1 = ~makeBuffers.("audio/".resolveRelative, (), true); // audio files loaded into monophonic buffers
~b2 = ~makeBuffers.("audio/".resolveRelative, (), false); // audio files loaded into stereophonic buffers