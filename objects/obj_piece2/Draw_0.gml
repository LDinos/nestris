/// @description Insert description here
// You can write your code in this editor
var spr = sprite_index
if (image_angle == -90 || image_angle == 270) spr = asset_get_index(sprite_get_name(sprite_index)+"_90")
else if (image_angle == 90 || image_angle == -270) spr = asset_get_index(sprite_get_name(sprite_index)+"_270")
else if abs(image_angle) == 180 spr = asset_get_index(sprite_get_name(sprite_index)+"_180")


shader_set(shd_hue)
shader_set_uniform_f( global.hueshift, (global.level2*62 mod 620)/100)
//draw_sprite_ext(spr,0,x,y,1,1,0,global.level_colors[(global.level mod 10)],1)
draw_sprite(spr,0,x,y)
shader_reset()

