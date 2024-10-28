//ghost counter set up
var ghostcount = clamp(instance_number(Ghost),0,999)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(DefaultFont)
var plural = " ghosts"
if(ghostcount=1){plural=" ghost"}
if(ghostcount>0){gametime+=1}
//timer set up
var minute = (floor(gametime/3600)-1)
if(minute<0){minute+=12}
minute = string_replace_all(string_format(((minute mod 12)+1),2,0)," ","0")
var second = string_replace_all( string_format((floor(gametime/60)mod 60),2,0)," ","0")

var tempdir = 0
draw_set_color(c_black)
var str = minute+":"+second+" AM"
repeat 4
{
	tempdir+=90
	draw_text_transformed(64+lengthdir_x(4,tempdir),64+lengthdir_x(4,tempdir),str,4,4,0)
}
draw_set_color(c_ltgray)
if(floor(gametime/3600)>=4)and(gametime mod 60 <= 10){draw_set_color(c_red)}
draw_text_transformed(64,64,str,4,4,0)

if(gametime<240)
{
	draw_set_halign(fa_middle)
	draw_set_color(c_black)
	var str = "Vanquish all ghosts before 5 AM"
	repeat 4
	{
		tempdir+=90
		draw_text_transformed(768+lengthdir_x(4,tempdir),432+lengthdir_x(4,tempdir),str,4,4,0)
	}
	draw_set_color(c_white)
	draw_text_transformed(768,432,str,4,4,0)
}

draw_set_halign(fa_right)

draw_set_color(c_black)
repeat 4
{
	tempdir+=90
	draw_text_transformed(1472+lengthdir_x(4,tempdir),64+lengthdir_x(4,tempdir),string(ghostcount)+plural+" left",4,4,0)
}
draw_set_color(c_ltgray)
draw_text_transformed(1472,64,string(ghostcount)+plural+" left",4,4,0)