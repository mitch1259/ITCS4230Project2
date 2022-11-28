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
				sprite_crouch: spr_lunaC,
				sprite_walk: spr_lunaWalk,
				sprite_dashB: spr_lunaDashB,
				sprite_dashF: spr_lunaDashF,
				sprite_jump: spr_lunaJump,
			};
		case CharacterName.Sean:
			return {
				sprite_idle: spr_seanStand,
				sprite_punch: spr_seanP,
				sprite_kick: spr_seanK,
				sprite_crouch: spr_seanC,
				sprite_walk: spr_seanWalk,
				sprite_dashB: spr_seanDashB,
				sprite_dashF: spr_seanDashF,
				sprite_jump: spr_seanJump,
				};
		case CharacterName.Paulina:
			return {
				sprite_idle: spr_paulinaStand,
				sprite_punch: spr_paulinaP,
				sprite_kick: spr_paulinaK,
				sprite_crouch: spr_paulinaC,
				sprite_walk: spr_paulinaWalk,
				sprite_dashB: spr_paulinaDashB,
				sprite_dashF: spr_paulinaDashF,
				sprite_jump: spr_paulinaJump,
				};
		case CharacterName.Jessica:
			return {};
	}
}
