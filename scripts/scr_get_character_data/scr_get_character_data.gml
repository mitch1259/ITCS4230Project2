enum CharacterName {
	Luna,
	Sean,
	Paulina,
	Jessica,
}

/// @desc Get character's data
/// @param {real} character Character
/// @returns {struct} Character data
function get_character_data(character) {
	switch character {
		case CharacterName.Luna:
			return {
				sprite_idle: spr_lunaStand,
				sprite_punch: spr_lunaP,
				sprite_kick: spr_lunaK,
			};
		case CharacterName.Sean:
			return {};
		case CharacterName.Paulina:
			return {};
		case CharacterName.Jessica:
			return {};
	}
}
