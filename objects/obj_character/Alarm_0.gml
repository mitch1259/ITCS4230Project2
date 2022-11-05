/// @description Combo timed out or finished

if active_combo == ComboState.None {
	show_debug_message("Combo timed out");

	clear_current_combo();
} else {
	show_debug_message("Combo finished");

	active_combo = ComboState.None;
}
