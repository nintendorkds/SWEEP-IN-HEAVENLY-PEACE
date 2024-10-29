if(started = 0)
{
	var contnum = 0
	var makeme = []
	var dontmakeme = []

	var pressedabutton = 0

	//checks keyboards yaeahsoidyuhoaiuhoaiuhdpioujhapsd
	if(keyboard_check(vk_anykey))
	{
		pressedabutton=1
		if(array_contains(dontmakeme,contnum)=0)and(pressed=0)
		{
			global.controller=0
			playsound(SweepSound)
			started=1
			exit;
		}
	}

	contnum+=1

	//checks controleder :) jdnhfolicuhsaj dfpiudcuu
	repeat 8
	{
		if(gamepad_button_check(contnum-1,gp_start))or(gamepad_button_check(contnum-1,gp_face1))or(gamepad_button_check(contnum-1,gp_face2))or(gamepad_button_check(contnum-1,gp_face3))or(gamepad_button_check(contnum-1,gp_face4))
		{
			pressedabutton=1
			if(array_contains(dontmakeme,contnum)=0)and(pressed=0)
			{
				global.controller=contnum
				playsound(SweepSound)
				started=1
				exit;
			}
		}
		contnum+=1
	}
	if(pressedabutton=0){pressed=0}
}
else
{
	audio_stop_sound(music)
	started+=1
	if(started>=30)
	{
		if(image_index=0)
		{
			room_goto(Cutscene1Room)
		}
		else
		{
			room_goto(Mansion1)
		}
	}
}