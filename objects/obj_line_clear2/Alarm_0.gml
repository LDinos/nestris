/// @description Insert description here
// You can write your code in this editor
if loops == 6
{
	if instance_number(obj_line_clear2) == 1 
	{
		with(obj_block2) {y += GRID*move_down; move_down = 0;}
		if (global.line_clears2 >= global.line_clear_goal2)
		{
			audio_play_sound(snd_levelup,0,false)		
			global.level2++
			global.line_clear_goal2 += 10
		}
	}
	instance_destroy()
}
else
{
	instance_destroy(instance_position(x+GRID*loops-16,y,obj_block2))
	instance_destroy(instance_position(x-GRID*loops+16,y,obj_block2))
	loops++
	alarm[0] = 4
}
