/// Make the board fully empty
//global.level = 10
first_level = global.level //if we restart, set global level to this
if global.online
{
	if (!global.amhost) {x = 576; with(obj_block) {x+= 448} instance_create_depth(0,0,0,obj_client)}
	else instance_create_depth(0,0,0,obj_server)
}
global.tetrises = 0 //number of tetrises
global.num_clears = 0 //number of times the player cleared line(s)
score = 0
global.line_clears = 0 //number of lines the player has cleared in total
global.line_drought = 0; //number of turns a line piece hasn't appeared
global.hueshift = shader_get_uniform(shd_hue,"u_Position") 

// Make the level speeds
level_speed[0] = 48; level_speed[6] = 18; level_speed[12] = 5; level_speed[18] = 3; level_speed[24] = 2;
level_speed[1] = 43; level_speed[7] = 13; level_speed[13] = 4; level_speed[19] = 2; level_speed[25] = 2;
level_speed[2] = 38; level_speed[8] = 8; level_speed[14] = 4; level_speed[20] = 2; level_speed[26] = 2;
level_speed[3] = 33; level_speed[9] = 6; level_speed[15] = 4; level_speed[21] = 2; level_speed[27] = 2;
level_speed[4] = 28; level_speed[10] = 5; level_speed[16] = 3; level_speed[22] = 2; level_speed[28] = 2;
level_speed[5] = 23; level_speed[11] = 5; level_speed[17] = 3; level_speed[23] = 2; level_speed[29] = 1;

// Make the lines needed to go to next level
level_line_goal[0] = 10; level_line_goal[6] = 70; level_line_goal[12] = 100; level_line_goal[18] = 130; level_line_goal[24] = 190;
level_line_goal[1] = 20; level_line_goal[7] = 80; level_line_goal[13] = 100; level_line_goal[19] = 140; level_line_goal[25] = 200;
level_line_goal[2] = 30; level_line_goal[8] = 90; level_line_goal[14] = 100; level_line_goal[20] = 150; level_line_goal[26] = 200;
level_line_goal[3] = 40; level_line_goal[9] = 100; level_line_goal[15] = 100; level_line_goal[21] = 160; level_line_goal[27] = 200;
level_line_goal[4] = 50; level_line_goal[10] = 100; level_line_goal[16] = 110; level_line_goal[22] = 170; level_line_goal[28] = 200;
level_line_goal[5] = 60; level_line_goal[11] = 100; level_line_goal[17] = 120; level_line_goal[23] = 180; level_line_goal[29] = 200;

global.line_clear_goal = level_line_goal[global.level]
global.line_clear_goal2 = global.line_clear_goal
/// Make the seed (1000 pieces then repeat from beginning)
if global.amhost || !global.online
{
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
else {pieces[0] = spr_piece_i; pieces[1] = spr_piece_i; pieces[2] = spr_piece_i}
piece_index = 0; //which array index are we at the moment? (goes up by +1 everytime a piece spawns)
if global.online piece_index2 = 0 //for player2

if !global.online
{
	spawn_piece(0);
	with(obj_piece) frames_remaining = 120
}