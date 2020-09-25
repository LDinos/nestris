// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_level_frame_speed(){
	var l = clamp(global.level,0,29)
	return obj_board.level_speed[l]-1;
}