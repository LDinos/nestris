/// @description If you press join and connecto, this will be created. Gets info from server
// You can write your code in this editor
network_set_config(network_config_connect_timeout,6000)
client_socket = network_create_socket(network_socket_tcp);
server = network_connect(client_socket , global.ip, global.port);
buffer = buffer_create(1,buffer_grow,1)
if server < 0
    {
		room_goto(rm_menu)
		network_destroy(client_socket)
    }
/*else
    {

    }*/

