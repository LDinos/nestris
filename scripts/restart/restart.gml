// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function restart(){
	with(obj_block) if image_alpha != 0 instance_destroy()
	with(obj_piece) instance_destroy()
	with(obj_block2) instance_destroy()
	with(obj_piece2) instance_destroy()
	with(obj_line_clear) instance_destroy()
	with(obj_line_clear2) instance_destroy()
	score = 0
	global.score2 = 0
	global.line_clears = 0 //number of lines the player has cleared in total
	global.line_clears2 = 0 //number of lines the player has cleared in total
	global.line_drought = 0; //number of turns a line piece hasn't appeared
	global.level = obj_board.first_level
	global.level2 = global.level
	global.num_clears = 0
	global.num_clears2 = 0
	global.tetrises = 0
	global.tetrises2 = 0
	global.line_drought = 0; //number of turns a line piece hasn't appeared
	global.line_drought2 = 0; //number of turns a line piece hasn't appeared
	with(obj_board)
	{
		alarm[0] = -1
		piece_index = 0
		piece_index2 = 0
		global.line_clear_goal = level_line_goal[global.level]
		global.line_clear_goal2 = global.line_clear_goal
		for(var i = 0; i < 1000; i++) 
		{
		pieces[i] = choose(spr_piece_i,
							spr_piece_j,
							spr_piece_l,
							spr_piece_o,
							spr_piece_s,
							spr_piece_t,
							spr_piece_z)
		}
	}
	with(global.net) alarm[0] = 60
	audio_play_sound(snd_restart,0,0)
}