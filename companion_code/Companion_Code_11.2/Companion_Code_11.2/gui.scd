// Companion Code 11.2: GUI
// A State-Based Composition - Using a GUI for Live Interaction

// This sub-file builds a GUI for performing the composition. Comments are included throughout.

var win, moduleButtons, moduleLabels, oneShotButtons, oneShotLabels, enabled;

// We first use iteration to create a row of eight module buttons that toggle the on/off status of each of the eight modules. When a button's state is one, they play (fade in) their assigned module, and when their state is zero, they fade out their module. Making these buttons non-focusable produces a more unified appearance.

moduleButtons = [
	\beeps, \grainPhase, \grainDrone, \clunks,
	\melody, \fluteRhythm, \noiseDrone, \pulses
].collect({ |name, i|
	Button()
	.states_([
		[name, Color.gray(0.4), Color.gray(0.8)],
		[name, Color.gray(0.15), Color(0.5, 0.85, 1)]
	])
	.action_({ |btn|
		if(btn.value == 1, { ~playModule.(name) }, { ~fadeModule.(name) });
	})
	.canFocus_(false);
});

// Below the module buttons, we have a row of three buttons that trigger one-shots. They only have one state, but their action plays a routine that displays a brief color flash, to provide visual feedback to the user.

oneShotButtons = [\comb, \boom, \insect].collect({ |name, i|
	Button()
	.states_([[ name, Color.gray(0.4), Color.gray(0.8) ]])
	.action_({ |btn|
		~oneShots[name].();
		Routine({
			btn.states_([[ name, Color.gray(0.15), Color(0.5, 0.85, 1) ]]);
			0.08.wait;
			btn.states_([[ name, Color.gray(0.4), Color.gray(0.8) ]]);
		}).play(AppClock);
	})
	.canFocus_(false);
});

// In addition to using the mouse to control button states, the computer keyboard can also be used (keyDownActions are defined later in this sub-file). The numbers 1-8 control the modules, and the letters E, R, and T trigger one-shots.

moduleLabels = [\1, \2, \3, \4, \5, \6, \7, \8].collect({ |char, i|
	StaticText()
	.font_(Font(Font.defaultSansFace, 18))
	.string_(char).align_(\center);
});

oneShotLabels = [\E, \R, \T].collect({ |char, i|
	StaticText()
	.font_(Font(Font.defaultSansFace, 18))
	.string_(char).align_(\center);
});

// Next, we assemble the views on a window.

win = Window("state-based composition", Rect(200, 200, 750, 230)).front
.layout_(
	VLayout(
		StaticText()
		.font_(Font(Font.defaultSansFace, 18))
		.string_("modules").align_(\center),

		HLayout(*moduleButtons),
		HLayout(*moduleLabels),

		StaticText()
		.font_(Font(Font.defaultSansFace, 18))
		.string_("one-shots").align_(\center),

		HLayout(*oneShotButtons),
		HLayout(*oneShotLabels)
	)
);

// One potential issue with computer keyboards is the key-repeating behavior that occurs when a key is held down. Without taking proper precautions, a held key can rapidly generate a cluster of one-shots, potentially producing loud sound and near-instant CPU overloads! To combat this problem, we use 11 Booleans (one for each button) stored in an array named 'enabled.' Each key-down action only occurs if its corresponding boolean is true, and each key-down sets its boolean to false before performing its action. A corresponding key-up action is required to re-enable key-down actions.

// Not all operating systems may respond to this precautionary code in the same way. Some operating systems make no distinction between a holding a key down vs. physically pressing a key rapidly and repeatedly. Although this behavior may be configurable in your operating system's settings, the most reliable approach is to be conscious about how you interact with this GUI, being careful not to accidentally hold down any keys.

enabled = true ! 11;

win.view.keyDownAction_({ |view, char|
	case
	{ (char == $1) && (enabled[0]) } {
		enabled[0] = false;
		moduleButtons[0].valueAction_(1 - moduleButtons[0].value)
	}
	{ (char == $2) && (enabled[1]) } {
		enabled[1] = false;
		moduleButtons[1].valueAction_(1 - moduleButtons[1].value)
	}
	{ (char == $3) && (enabled[2]) } {
		enabled[2] = false;
		moduleButtons[2].valueAction_(1 - moduleButtons[2].value)
	}
	{ (char == $4) && (enabled[3]) } {
		enabled[3] = false;
		moduleButtons[3].valueAction_(1 - moduleButtons[3].value)
	}
	{ (char == $5) && (enabled[4]) } {
		enabled[4] = false;
		moduleButtons[4].valueAction_(1 - moduleButtons[4].value)
	}
	{ (char == $6) && (enabled[5]) } {
		enabled[5] = false;
		moduleButtons[5].valueAction_(1 - moduleButtons[5].value)
	}
	{ (char == $7) && (enabled[6]) } {
		enabled[6] = false;
		moduleButtons[6].valueAction_(1 - moduleButtons[6].value)
	}
	{ (char == $8) && (enabled[7]) } {
		enabled[7] = false;
		moduleButtons[7].valueAction_(1 - moduleButtons[7].value)
	}
	{ ((char == $e) || (char == $E)) && (enabled[8]) } {
		enabled[8] = false;
		oneShotButtons[0].valueAction_(0)
	}
	{ ((char == $r) || (char == $R)) && (enabled[9]) } {
		enabled[9] = false;
		oneShotButtons[1].valueAction_(0)
	}
	{ ((char == $t) || (char == $T)) && (enabled[10]) } {
		enabled[10] = false;
		oneShotButtons[2].valueAction_(0)
	};
});

win.view.keyUpAction_({ | view, char|
	case
	{ char == $1 } { enabled[0] = true }
	{ char == $2 } { enabled[1] = true }
	{ char == $3 } { enabled[2] = true }
	{ char == $4 } { enabled[3] = true }
	{ char == $5 } { enabled[4] = true }
	{ char == $6 } { enabled[5] = true }
	{ char == $7 } { enabled[6] = true }
	{ char == $8 } { enabled[7] = true }
	{ (char == $e) || (char == $E) } { enabled[8] = true }
	{ (char == $r) || (char == $R) } { enabled[9] = true }
	{ (char == $t) || (char == $T) } { enabled[10] = true };
});