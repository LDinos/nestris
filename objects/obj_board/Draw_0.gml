//SCORE
draw_set_font(fnt_numbers_small)
//draw_text(room_width-64,16,fps_real)
draw_set_font(fnt_numbers)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if (room == rm_singleplayer)
{
	draw_text(864,208,"SCORE")
	draw_text(864,208+32,score)

	//NEXT PIECE
	var nextpiece = piece_index
	if (nextpiece > array_length(pieces)-1) nextpiece = 0 //restart from the beginning
	shader_set(shd_hue)
	shader_set_uniform_f( global.hueshift, (global.level*62 mod 620)/100)
	draw_sprite_ext(pieces[nextpiece],0,832,496,0.75,0.75,0,c_white,1)
	shader_reset()

	//LEVEL TEXT
	draw_text(846,654,"LEVEL")
	draw_text(846,654+32,global.level)

	//LINES
	draw_text(544+8,110+8,"LINES "+string(global.line_clears))
	var c = global.line_drought > 10 ? c_maroon+abs(sin(current_time/1000)*127) : c_white
	draw_text_transformed_color(192, 142, "DROUGHT " + string(global.line_drought),.75,.75,0,c,c,c,c,1)

	//TETRIS RATE
	var trt = 0
	if (global.num_clears > 0) trt = round((global.tetrises/global.num_clears)*100)
	draw_text(192,334,"TRT "+string(trt) + "%")
	draw_set_font(fnt_numbers_small)
	draw_text(192,380+64,"R RESTART")
	draw_text(192,380+64+64,"SHIFT+R GO TO MENU")
	draw_text(192,380+64+64+64,"X/Z ROTATE")
	draw_text(192,380+64+64+64+64,"SHIFT DAS CHARGE")
}
else
{
	{
	//SCORE OF ME
	var scorexx = global.amhost ? 0 : P2_OFFSET
	var condition = (score -global.score2 <= 0)
	var col = condition*c_red + !condition*c_lime
	var plusminus = condition ? "-" : "+"
	draw_text(284+scorexx,116-32,string(score)+"-"+string(global.line_clears))
	draw_text_color(284+scorexx,116,plusminus+string(abs(score-global.score2)), col,col,col,col,1)
	var starty = 192
	var xx = global.amhost ? 0 : 928
	
	draw_text(284+scorexx,920,global.user)
	
	//NEXT PIECE OF ME
	draw_rectangle_color(xx,starty,xx+3*32,starty + 3*32,c_black,c_black,c_black,c_black,false)
	var nextpiece = piece_index
	if (nextpiece > array_length(pieces)-1) nextpiece = 0 //restart from the beginning
	shader_set(shd_hue)
	shader_set_uniform_f( global.hueshift, (global.level*62 mod 620)/100)
	draw_sprite_ext(pieces[nextpiece],0,xx+96/2,starty+(((starty + 3*32) - starty)/2),0.5,0.5,0,c_white,1)
	shader_reset()
	
	//LEVEL OF ME
	starty += 4*32
	draw_rectangle_color(xx,starty,xx+3*32,starty + 3*32,c_black,c_black,c_black,c_black,false)
	draw_set_font(fnt_numbers_small)
	draw_text(xx+96/2,starty+(((starty + 3*32) - starty)/2),"LVL " + string(global.level))
	draw_set_font(fnt_numbers)
	starty += 4*32
	
	//TETRIS RATE OF ME
	var trt = 0
	if (global.num_clears > 0) trt = round((global.tetrises/global.num_clears)*100)
	draw_rectangle_color(xx,starty,xx+3*32,starty + 3*32,c_black,c_black,c_black,c_black,false)
	draw_text(xx+48,starty+48,"TRT\n "+string(trt) + "%")
	starty += 4*32
	
	//DROUGHT OF ME
	draw_rectangle_color(xx,starty,xx+3*32,starty + 3*32,c_black,c_black,c_black,c_black,false)
	var c = global.line_drought > 10 ? c_maroon+abs(sin(current_time/1000)*127) : c_white
	draw_sprite_ext(spr_small_i,0,xx+48, starty +1*32, 1,1,0,c,1)
	draw_text_transformed_color(xx+48, starty +2*32, string(global.line_drought),.75,.75,0,c,c,c,c,1)
	starty += 4*32
	
	//DROUGHT OF PLAYER2
	draw_rectangle_color(xx,starty,xx+3*32,starty + 3*32,c_black,c_black,c_black,c_black,false)
	var tetris_lead = (score - global.score2) / BASE_VAL_TETRIS*(global.level+1)
	draw_text_transformed_color(xx+48, starty +48, "TRTLD\n " + string(tetris_lead),.75,.75,0,col,col,col,col,1)
	
	}
	
	{
	//SCORE OF PLAYER 2
	var scorexx = global.amhost ? P2_OFFSET : 0
	var condition = (global.score2 - score <= 0)
	var col = condition*c_red + !condition*c_lime
	var plusminus = condition ? "-" : "+"
	draw_text(284+scorexx,116-32,string(global.score2)+"-"+string(global.line_clears2))
	draw_text_color(284+scorexx,116,plusminus+string(abs(global.score2 - score)), col,col,col,col,1)
	var starty = 192
	var xx = global.amhost ? 928 : 0
	
	//Name of player 2
	//286 912
	draw_text(284+scorexx,920,global.user2)
	
	//NEXT PIECE PLAYER 2
	draw_rectangle_color(xx,starty,xx+3*32,starty + 3*32,c_black,c_black,c_black,c_black,false)
	var nextpiece = piece_index2
	if (nextpiece > array_length(pieces)-1) nextpiece = 0 //restart from the beginning
	shader_set(shd_hue)
	shader_set_uniform_f( global.hueshift, (global.level2*62 mod 620)/100)
	draw_sprite_ext(pieces[nextpiece],0,xx+96/2,starty+(((starty + 3*32) - starty)/2),0.5,0.5,0,c_white,1)
	shader_reset()
	
	//LEVEL OF PLAYER2
	starty += 4*32
	draw_rectangle_color(xx,starty,xx+3*32,starty + 3*32,c_black,c_black,c_black,c_black,false)
	draw_set_font(fnt_numbers_small)
	draw_text(xx+96/2,starty+(((starty + 3*32) - starty)/2),"LVL " + string(global.level2))
	draw_set_font(fnt_numbers)
	starty += 4*32
	//TETRIS RATE OF PLAYER2
	var trt = 0
	if (global.num_clears2 > 0) trt = round((global.tetrises2/global.num_clears2)*100)
	draw_rectangle_color(xx,starty,xx+3*32,starty + 3*32,c_black,c_black,c_black,c_black,false)
	draw_text(xx+48,starty+48,"TRT\n "+string(trt) + "%")
	starty += 4*32
	
	//DROUGHT OF PLAYER2
	draw_rectangle_color(xx,starty,xx+3*32,starty + 3*32,c_black,c_black,c_black,c_black,false)
	var c = global.line_drought2 > 10 ? c_maroon+abs(sin(current_time/1000)*127) : c_white
	draw_sprite_ext(spr_small_i,0,xx+48, starty +1*32, 1,1,0,c,1)
	draw_text_transformed_color(xx+48, starty +2*32, string(global.line_drought2),.75,.75,0,c,c,c,c,1)
	starty += 4*32
	
	//DROUGHT OF PLAYER2
	draw_rectangle_color(xx,starty,xx+3*32,starty + 3*32,c_black,c_black,c_black,c_black,false)
	var tetris_lead = (global.score2 - score) / BASE_VAL_TETRIS*(global.level2+1)
	draw_text_transformed_color(xx+48, starty +48, "TRTLD\n " + string(tetris_lead),.75,.75,0,col,col,col,col,1)
	
	}
	

}