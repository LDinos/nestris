function put_piece(player2){
	var offset = global.amhost ? P2_OFFSET : -P2_OFFSET
	var piece = obj_piece
	var block = obj_block
	var gridrow = (y -  obj_board.y )div GRID
	var entry_delay = clamp((20 - gridrow),12,30)
	//show_message(string(y -  obj_board.y ))
	if player2 {piece = obj_piece2; block = obj_block2;}
	else audio_play_sound(snd_piece_place,0,false)
	var checks_left = 4;
	for(var i = 19; i>=0; i--)
	{
		for(var j = 9; j>=0; j--)
		{
			var xx = obj_board.x + GRID*j + (player2*offset)
			var yy = obj_board.y + GRID*i
			if position_meeting(xx,yy,piece) 
			{
				var bl = instance_create_depth(xx,yy,-1,block);
				bl.image_index = subskin-1
				if (--checks_left == 0) break;
			}	
		}
		if (checks_left == 0) break;
	}
	if !player2 //if this is about the other player, dont check for clears, the other guy did it for us
	{
		if (global.online)
		{
			with(global.net)
			{
				buffer_seek(buffer,buffer_seek_start,0)
				buffer_write(buffer,buffer_u8,NET_PIECE_PUT)
				network_send_packet(client_socket,buffer,buffer_tell(buffer))
			}
		}
		if !check_line_clears(false) {with(obj_board) alarm[0] = entry_delay } //if no clears, spawn piece immediatly
	}
	else check_line_clears(true)
	
	instance_destroy()
	
}