// Companion Code 9.1: Buffers
// A Template for Large-Scale Projects

// This sub-file defines and calls a buffer-loading function, which organizes audio files into an Event stored in the interpreter variable 'b'. The ~makeBuffers function is adapted from Companion Code 4.1, and the audio files are copied from Companion Code 4.2.

~makeBuffers = { |path, event|
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
			bufArray = files.collect({ |n| Buffer.read(s, n.fullPath) });
			event[dir.folderName.asSymbol] = bufArray;
		};
	};

	if (contents.select({ |n| n.isFolder }).size > 0)
	{
		var folders = contents.select({ |n| n.isFolder });
		folders.do({ |n| ~makeBuffers.(n.fullPath, event) });
	};

	event;
};

b = ~makeBuffers.("audio/".resolveRelative, ());