/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(ord("R")) && client_connected
{
	restart()
	alarm[0] = -1
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NET_RESTART_SIGNAL)
	network_send_packet(client_socket,buffer,buffer_tell(buffer))
}