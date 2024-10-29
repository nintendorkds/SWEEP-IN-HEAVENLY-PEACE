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
	started=0
	pressed=1
	image_index+=1
	if(sprite_index=Cutscene2)and(image_index>1)and(imtriggered=0)
	{
		imtriggered=1
		audio_stop_sound(music)
		music = audio_play_sound(mus_gma,0,0)
	}
	if(image_index>=maxframes){audio_stop_sound(music);room_goto(myroom)}
}