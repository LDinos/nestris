/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_numbers)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if global.online draw_text(room_width/2,64,"PORT IS 6969")

draw_text(room_width/2,128,"TYPE PREFERED LEVEL (0-29)")
draw_text(room_width/2,128+64,"LEVEL " + str)

draw_text(room_width/2,512,"TYPE PREFERED SEED OR 0 FOR RANDOM")
draw_text(room_width/2,512+64,"SEED " + str2)

draw_rectangle(room_width/2-128,128+32 + 384*option,room_width/2+128,128+96 + 384*option,true)
