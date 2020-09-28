// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function make_ghost_piece(){
	if global.ghost_allowed
	{
	var row = 1;
	while !place_meeting(x,y+GRID*row,obj_block) row++
	ghost_y = y+GRID*(row-1)
	}
	//ghost_x = x
}