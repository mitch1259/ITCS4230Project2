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
			return {
				sprite_idle: spr_seanStand,
				sprite_punch: spr_seanP,
				sprite_kick: spr_seanK,
				};
		case CharacterName.Paulina:
			return {
				sprite_idle: spr_paulinaStand,
				sprite_punch: spr_paulinaP,
				sprite_kick: spr_paulinaK,
				};
		case CharacterName.Jessica:
			return {};
	}
}
