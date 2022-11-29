/// @description Character action finished

show_debug_message("Action finished");

set_character_action(CharacterAction.None);

if location_state == LocationState.Air {
	set_character_action(CharacterAction.Jump);
}
