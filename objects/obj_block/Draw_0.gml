/// @description Insert description here
// You can write your code in this editor
shader_set(shd_hue)
shader_set_uniform_f( global.hueshift, (global.level*62 mod 620)/100)
draw_self()
//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,image_alpha)
shader_reset()