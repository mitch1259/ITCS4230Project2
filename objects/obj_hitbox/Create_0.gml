/// @description Initialize parent

#macro X1 (x - (width / 2))
#macro Y1 (y - (height / 2))
#macro X2 (x + (width / 2))
#macro Y2 (y + (height / 2))

/// @desc Sync location with parent location and orientation
function sync_location() {
	x = parent.x  + (parent.image_xscale * x_offset);
	y = parent.y  + (parent.image_yscale * y_offset);
}

sync_location();
