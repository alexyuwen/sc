// Companion Code 10.1: GUI
// An Event-Based Composition

// This sub-file builds a simple GUI for performing and navigating the composition. When built, the "play next event" button is in focus, so the spacebar can be used to step through performance events.

Window("event-based composition", Rect(200, 200, 300, 150)).front
.layout_(
	VLayout(

		// This view is the only GUI item that can be in focus, allowing us
		// to use the spacebar as an alternative to clicking with the mouse.
		Button()
		.states_([["play next event"]])
		.action_({ ~events.next.(); }),

		HLayout(
			StaticText()
			.string_("  start playing at:"),

			PopUpMenu()
			.canFocus_(false)

			// Allowing reselection makes it possible to re-select a rehearsal
			// cue, even if it is was the most recently selected item.
			.allowsReselection_(true)

			// The act of physically clicking on this pop-up menu is what
			// stops all patterns and simulates [cmd]+[period].
			.mouseDownAction_({ Pbindef.all.do({ |p| p.stop }); CmdPeriod.run; })
			.items_([ "event 0", "event 4", "event 6", "event 7", "event 8" ])
			.action_({ |menu|

				case

				// Making a pop-up menu selection is what evaluates
				// the corresponding rehearsal cue function.
				{ menu.value == 0 } { ~events.reset; ~events.next.(); }
				{ menu.value == 1 } { ~startAt[\event4].(); }
				{ menu.value == 2 } { ~startAt[\event6].(); }
				{ menu.value == 3 } { ~startAt[\event7].(); }
				{ menu.value == 4 } { ~startAt[\event8].(); };
			})
		),

		Button()
		.canFocus_(false)
		.states_([["stop"]])
		.action_({
			Pbindef.all.do({ |p| p.stop });
			CmdPeriod.run;
		}),

		Button()
		.canFocus_(false)
		.states_([["reset"]])
		.action_({
			Pbindef.all.do({ |p| p.stop });
			CmdPeriod.run;
			~events.reset;
		})
	)
);