score = 0
global.score2 = 0
global.line_clears = 0
global.line_clears2 = 0
global.level = 0
global.level2 = 0
global.line_clear_goal = 0
global.line_clear_goal2 = 0
global.num_clears = 0
global.num_clears2 = 0
global.tetrises = 0
global.tetrises2 = 0
global.line_drought = 0; //number of turns a line piece hasn't appeared
global.line_drought2 = 0; //number of turns a line piece hasn't appeared


ini_open("controls.ini")
	global.KEY_ROT_LEFT = ini_read_real("Controls","KEY_ROT_LEFT",90)
	global.KEY_ROT_RIGHT = ini_read_real("Controls","KEY_ROT_RIGHT",88)
	global.KEY_SHIFT = ini_read_real("Controls","KEY_SHIFT",vk_shift)
	global.KEY_MOVE_DOWN = ini_read_real("Controls","KEY_MOVE_DOWN",vk_down)
	global.KEY_MOVE_LEFT = ini_read_real("Controls","KEY_MOVE_LEFT",vk_left)
	global.KEY_MOVE_RIGHT = ini_read_real("Controls","KEY_MOVE_RIGHT",vk_right)
ini_close()

ini_open("player.ini")
	global.user = ini_read_string("User","Name","Player")
	global.user2 = "Player"
ini_close()