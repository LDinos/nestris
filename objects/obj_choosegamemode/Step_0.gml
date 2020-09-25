/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(ord("H")) {global.net = obj_server; global.port = 6969; global.online = true; global.amhost = true; room_goto(rm_chooselevel)}
else if keyboard_check_pressed(ord("J")) {global.net = obj_client; global.online = true; global.port = 6969; global.amhost = false; room_goto(rm_joinonline)}
else if keyboard_check_pressed(ord("S")){global.online = false; global.amhost = true; room_goto(rm_chooselevel)}