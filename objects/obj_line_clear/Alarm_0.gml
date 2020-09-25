/// @description Insert description here
// You can write your code in this editor
if loops == 6
{
	if instance_number(obj_line_clear) == 1 
	{
		with(obj_block) {y += GRID*move_down; move_down = 0;}
		if (global.line_clears >= global.line_clear_goal)
		{
			audio_play_sound(snd_levelup,0,false)		
			global.level++
			global.line_clear_goal += 10
		}
		spawn_piece(0)
	}
	instance_destroy()
}
else
{
	instance_destroy(instance_position(x+GRID*loops-16,y,obj_block))
	instance_destroy(instance_position(x-GRID*loops+16,y,obj_block))
	loops++
	alarm[0] = 4
}
