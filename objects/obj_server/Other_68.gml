var n_id = ds_map_find_value(async_load, "id");

//if n_id == server_socket
{
    var t = ds_map_find_value(async_load, "type");
    switch(t)
        {
        case network_type_connect:
            var sock = ds_map_find_value(async_load, "socket")
			client_socket = sock
			if !client_connected
			{
				global.level2 = global.level
				global.line_clear_goal = obj_board.level_line_goal[global.level]
				global.line_clear_goal2 = global.line_clear_goal
				buffer_seek(buffer,buffer_seek_start,0)
				buffer_write(buffer,buffer_u8,NET_CONNECT_SUCCESS)
				buffer_write(buffer,buffer_u8,global.level)
				buffer_write(buffer,buffer_string,global.user)
				buffer_write(buffer,buffer_u32,random_get_seed())
				network_send_packet(client_socket,buffer,buffer_tell(buffer))
				spawn_piece(0)
				//spawn_piece(P2_OFFSET)
				with(obj_piece) frames_remaining = 120
			}       
			client_connected = true
            break;
        case network_type_disconnect:
	        client_socket = noone
			client_connected = false
            break;
        case network_type_data:
            //Data handling here...
			ip = ds_map_find_value(async_load, "ip");
			var buffer2 = ds_map_find_value(async_load, "buffer")
			scr_recieved_packet(buffer2)
            break;
        }
}
