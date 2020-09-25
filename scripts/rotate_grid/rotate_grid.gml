// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rotate_grid(){
	var right_rot = false;
	// 0 -> 90 = left rotation
	// 0 -> -90 = right rotation
	// 270 -> 0 = left rotation
	// -270 -> 0 = right rotation
	if abs(prev_angle - image_angle) == -1
	{
		if abs(prev_angle-image_angle) > 90 right_rot = true
	}
	else if abs(prev_angle-image_angle) == 90 right_rot = true
}