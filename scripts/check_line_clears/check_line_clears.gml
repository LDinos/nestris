// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_line_clears(player2){
	var clears = 0;
	var block = obj_block
	if player2 block = obj_block2
	var offset = global.amhost ? P2_OFFSET : -P2_OFFSET
	for(var i = 19; i>=0; i--)
	{
		var must_clear = 0;		
		for(var j = 9; j>=0; j--)
		{
			var xx = obj_board.x + GRID*j + player2*offset
			var yy = obj_board.y + GRID*i
			if position_meeting(xx+8,yy+8,block) must_clear++
			else {/*show_message(string(must_clear) +" "+ string(xx)+"-"+string(yy));*/ must_clear = 0; break;}
			if (must_clear == 10) 
			{
				clears++
				if !player2
				{
					instance_create_depth(obj_board.x +(obj_board.x+GRID*9 - obj_board.x)/2+16,yy+8,-1,obj_line_clear)
					global.line_clears++
				}
				else 
				{
					instance_create_depth(obj_board.x+ player2*offset +(obj_board.x+GRID*9+ player2*offset - (obj_board.x+ player2*offset))/2+16,yy+8,-1,obj_line_clear2)
					global.line_clears2++
				}
			}
			
		}
	}
		
	if (clears > 0)
	{
		if !player2 global.num_clears++
		else global.num_clears2++
		switch(clears)
		{
			case 1:
				if !player2 score += BASE_VAL_SINGLE*(global.level+1)
				else global.score2 += BASE_VAL_SINGLE*(global.level2+1)
				audio_play_sound(snd_line_clear,0,false)
				break;
			case 2:
				if !player2 score += BASE_VAL_DOUBLE*(global.level+1)
				else global.score2 += BASE_VAL_DOUBLE*(global.level2+1)
				audio_play_sound(snd_line_clear,0,false)
				break;
			case 3:
				if !player2 score += BASE_VAL_TRIPLE*(global.level+1)
				else global.score2 += BASE_VAL_TRIPLE*(global.level2+1)
				audio_play_sound(snd_line_clear,0,false)
				break;
			case 4:
				if !player2 {score += BASE_VAL_TETRIS*(global.level+1); global.tetrises++}
				else {global.score2 += BASE_VAL_TETRIS*(global.level2+1); global.tetrises2++}					
				audio_play_sound(snd_tetris,0,false)
				/*var flash = instance_create_depth(0,0,-2,obj_white)
				if (global.online)
				{
					if (player2 && global.amhost) || (!player2 && !global.amhost) flash.x += room_width
					else flash.x -= room_width
				}*/
				break;			
		}
	}
	
	return (clears>0)
}