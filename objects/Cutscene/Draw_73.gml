
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_font(DefaultFont)
draw_set_color(c_white)

var drawntext = text[image_index mod array_length(text)]

draw_text_ext(bbox_left+96,bbox_bottom+8,drawntext,16,192)