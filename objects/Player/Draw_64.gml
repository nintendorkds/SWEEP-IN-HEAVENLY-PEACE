//screentransition
if(endme>0)
{
	screentransitiony+=6
}
if(screentransitiony>0)
{
	draw_set_color(c_black)
	draw_rectangle(0,0,1536,screentransitiony,0)
	if(endme=0)
	{
		screentransitiony-=16
	}
	else
	{
		//win or loss
		if(screentransitiony>=1000)
		{
			if(endme=1){room_goto(Cutscene2Room)}
			if(endme=2){room_goto(FailureScreen)}
		}
	}
}





var ghostcount = clamp(instance_number(Ghost),0,999)

//win
if(ghostcount<=0)and(endme=0){endme=1;audio_stop_sound(music);audio_play_sound(mus_win,1,0)}
//timer set up
var minute = (floor(gametime/3600)-1)
if(minute<0){minute+=12}
minute = string_replace_all(string_format(((minute mod 12)+1),2,0)," ","0")
var second = string_replace_all( string_format((floor(gametime/60)mod 60),2,0)," ","0")

//ghost counter set up
var plural = " ghosts"
if(floor(gametime/3600)<6)
{
	if(ghostcount>0){gametime+=1}
	formerghostcount=ghostcount
}
if(formerghostcount=1){plural=" ghost"}


draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(DefaultFont)
var tempdir = 0
draw_set_color(c_black)
var str = minute+":"+second+" AM"
repeat 4
{
	tempdir+=90
	draw_text_transformed(64+lengthdir_x(4,tempdir),64+lengthdir_x(4,tempdir),str,4,4,0)
}
draw_set_color(c_ltgray)
if(endme=1){draw_set_color(c_green)}
if((floor(gametime/3600)>=5)and(gametime mod 60 <= 10))or(endme=2){draw_set_color(c_red)}
//loss
if(floor(gametime/3600)>=6)and(endme=0)
{
	audio_stop_sound(music);audio_play_sound(mus_timesup,1,0)
	endme=2;
	with(Ghost)
	{
		disappear=1
		instance_destroy()
	}
}
draw_text_transformed(64,64,str,4,4,0)

if(endme)
{
	draw_set_halign(fa_middle)
	draw_set_color(c_black)
	var str = "Vanquish all ghosts before 6 AM"
	if(endme=1){str="YOU GOT EM!"}
	if(endme=2){str="Time's Up..."}
	
	repeat 4
	{
		tempdir+=90
		draw_text_transformed(768+lengthdir_x(4,tempdir),432+lengthdir_x(4,tempdir),str,4,4,0)
	}
	draw_set_color(c_white)
	if(endme=1){draw_set_color(c_green)}
	if(endme=2){draw_set_color(c_red)}
	draw_text_transformed(768,432,str,4,4,0)
}

draw_set_halign(fa_right)

draw_set_color(c_black)
repeat 4
{
	tempdir+=90
	draw_text_transformed(1472+lengthdir_x(4,tempdir),64+lengthdir_x(4,tempdir),string(formerghostcount)+plural+" left",4,4,0)
}
draw_set_color(c_ltgray)
if(endme=1){draw_set_color(c_green)}
if(endme=2){draw_set_color(c_red)}
draw_text_transformed(1472,64,string(formerghostcount)+plural+" left",4,4,0)