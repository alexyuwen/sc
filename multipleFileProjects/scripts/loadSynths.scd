// Load synths

"Loading synths...\n\n".postln;

PathName.new(PathName(thisProcess.nowExecutingPath).parentPath ++ "synths").filesDo({
	arg file;

	if(
		file.extension == "scd"
	){
		file.fullPath.postln;
		file.fullPath.load;
	}

});

"\n\n".postln;