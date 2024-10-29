depth=-y-32

timer+=1

//controller stuff -------------------------------------------------

if(controller=0)
{
		right=keyboard_check(vk_right);
		left=keyboard_check(vk_left);
		up=keyboard_check(vk_up);
		down=keyboard_check(vk_down);
		//right stick
		rsright=keyboard_check(ord("D"));
		rsleft=keyboard_check(ord("A"));
		rsup=keyboard_check(ord("W"));
		rsdown=keyboard_check(ord("S"));
		
		primary=keyboard_check(ord("Z"));
		secondary=keyboard_check(vk_lshift);
		tertiary=keyboard_check(ord("V"));
		grab=keyboard_check(ord("C"));
		jump=keyboard_check(ord("X"));
		pocket1=keyboard_check(vk_lcontrol);
		
		escape=keyboard_check(vk_escape);
		start=keyboard_check(vk_enter);
}	
else
{
	left = gamepad_button_check(controller-1, gp_padl);
	right = gamepad_button_check(controller-1, gp_padr);
	up = gamepad_button_check(controller-1, gp_padu);
	down = gamepad_button_check(controller-1, gp_padd);
	if(abs(gamepad_axis_value(controller-1,gp_axislh))) > deadzone
	{
		left = abs(min(gamepad_axis_value(controller-1,gp_axislh),0));
		right = max(gamepad_axis_value(controller-1,gp_axislh),0);
	}
	if(abs(gamepad_axis_value(controller-1,gp_axislv))) > deadzone*2
	{
		up = abs(min(gamepad_axis_value(controller-1,gp_axislv),0));
		down = max(gamepad_axis_value(controller-1,gp_axislv),0);
	}
	//right stick
	if(abs(gamepad_axis_value(controller-1,gp_axisrh))) > deadzone
	{
		rsleft = abs(min(gamepad_axis_value(controller-1,gp_axisrh),0));
		rsright = max(gamepad_axis_value(controller-1,gp_axisrh),0);
	}
	else
	{
		rsleft=0
		rsright=0
	}
		
	if(abs(gamepad_axis_value(controller-1,gp_axisrv))) > deadzone
	{
		rsup = abs(min(gamepad_axis_value(controller-1,gp_axisrv),0));
		rsdown = max(gamepad_axis_value(controller-1,gp_axisrv),0);
	}
	else
	{
		rsup=0
		rsdown=0
	}
		
	primary=gamepad_button_check(controller-1, gp_face3);
	secondary=gamepad_button_check(controller-1, gp_face4);
	tertiary=gamepad_button_check(controller-1, gp_face2);
	jump=gamepad_button_check(controller-1, gp_face1);
	escape=gamepad_button_check(controller-1, gp_select);
	start=gamepad_button_check(controller-1, gp_start);
	grab=gamepad_button_check(controller-1, gp_shoulderrb)or gamepad_button_check(controller-1, gp_shoulderr)
	pocket1=gamepad_button_check(controller-1, gp_shoulderlb)or gamepad_button_check(controller-1, gp_shoulderl)

}

var helddir = point_direction(0,0,right-left,down-up)

mag = clamp(point_distance(0,0,right-left,down-up),0,1)

//collision setup

var walllayer = Wall
if(layer_exists("WallTiles"))
{
	walllayer = layer_tilemap_get_id("WallTiles")
}

if(place_meeting(x,y+1,Wall))or(place_meeting(x,y+1,walllayer))
{
	if(grounded = 0)
	{
		//landing
		if(animation=1)or(animation=3)or(animation=4){animation=0}
		instance_create_depth(x,y+8,depth-1,Effect)
		crouchframes=4
	}
	grounded = 1
}
else
{
	grounded=0
}

//sets up wall slide availablility
var wallslideyvel = -1
var canwallslide = 0
var walljcheck = 3
if((place_meeting(x+walljcheck,y,walllayer)) or (place_meeting(x-walljcheck,y,walllayer))) and (yvel>wallslideyvel) and coyote<=0
{
	canwallslide=1
	canwalljumpframes=4
}

//gravity and halting yvel
if(grounded)
{
	canwalljumpframes=0
	yvel=0
	coyote = 8
}
else
{
	yvel+=grav
	coyote-=1
}

var tempwalk = walkspeed



if(sprite_index=JanitorRollSpr)or(animation=3)
{
	//allows you to walljump again and again
	if(canwallslide)
	{
		animation=0
	}
}

//animation shit

if(xvel!=0)and(grounded)and(animation=0){image_xscale=sign(xvel)}

if(animation=0)
{
	if(coyote>0)
	{
		if(down)
		{
			crouchframes=2
			animstep=0
			if(abs(xvel)>.1)
			{
				sprite_index=JanitorSlideSpr
				if(timer mod 6 = 1)and(abs(xvel)>1)
				{
					instance_create_depth(x-(image_xscale*8),y+12,depth-1,Effect,{sprite_index:SmallDustSpr,maxframes:2})
				}
			}
			else
			{
				sprite_index=JanitorDuckSpr
			}
		}
		else
		{
			if(abs(right-left)>0)and(abs(xvel)>.1)
			{
				//walking
				image_speed=abs(xvel/2)
				sprite_index=JanitorWalkSpr
				if(animstep=0)
				{
					if(image_index>=2)and(image_index<3)
					{
						animstep=1
						playsound(StepSound,.1,.05)
						instance_create_depth(x+xvel,y+12,depth-1,Effect,{sprite_index:SmallDustSpr,maxframes:2})
					}
				}
				else
				{
					if(image_index>=5)
					{
						animstep=0
						playsound(StepSound,.1,.05)
						instance_create_depth(x+xvel,y+12,depth-1,Effect,{sprite_index:SmallDustSpr,maxframes:2})
					}
				}
			}
			else
			{
				if(up)
				{
					sprite_index=JanitorThumbsUpSpr
				}
				else
				{
					//idle
					if(crouchframes<=0)
					{
						sprite_index=JanitorSpr
					}
					else
					{
						sprite_index=JanitorLandSpr
						crouchframes-=1
					}
				}
				animstep=0
			}
		}
	}
	else
	{
		animstep=0
		if(yvel>wallslideyvel)
		{
			//Wallslide
			if(canwallslide)and(place_meeting(x+(sign(right-left)*walljcheck),y,walllayer))
			{
				if(place_meeting(x+walljcheck,y,walllayer)){image_xscale=-1}else{image_xscale=1}
				if(timer mod 6 = 1)
				{
					instance_create_depth(x-(image_xscale*4),y,depth-1,Effect,{image_angle:image_xscale*-90,sprite_index:SmallDustSpr,maxframes:2})
				}
				sprite_index=JanitorWallSlideSpr
				//wall slide slows your fall
				yvel=clamp(yvel,-4,2)
			}
			else
			{
				sprite_index=JanitorFallSpr
			}
		}
		else
		{
			sprite_index=JanitorJumpSpr
		}
	}
}

//MOVEMENT OPTIONS -----------------------------------------------

if(jump or tertiary)and(jumppressed=0) // jump enters a buffer state
{
	jumppressed=1
	jumpbuffer=15
}
else
{
	if(jumpbuffer>0){jumpbuffer-=1}
}

if(canwalljumpframes>0){canwalljumpframes-=1}

if(jumpbuffer>0)and(animation=0)
{
	if(sprite_index=JanitorSlideSpr)
	{
		if(coyote>0)
		{
			//rolljump
			image_speed=1
			instance_create_depth(x,y+8,depth-1,Effect)
			yvel=-3
			coyote=0
			xvel=3.5*sign(xvel)
			jumpbuffer=0
			jumpingrn=1
			animation=1
			sprite_index=JanitorRollSpr
			playsound(SlideSound,.2,.5)
		}
	}
	else
	{
		if(canwalljumpframes>0)
		{
			//walljump
			if(place_meeting(x+walljcheck,y,walllayer)){image_xscale=-1}else{image_xscale=1}
			image_speed=1
			instance_create_depth(x,y,depth-1,Effect,{image_angle:image_xscale*-90})
			yvel=-4.5
			coyote=0
			xvel=2*sign(image_xscale)
			jumpbuffer=0
			jumpingrn=1
			animation=1
			sprite_index=JanitorRollSpr
			playsound(JumpSound,.2,.3)
		}
		else
		{
			if(coyote>0)
			{
				//Normal Jump
				instance_create_depth(x,y+8,depth-1,Effect)
				yvel=-4
				coyote=0
				jumpbuffer=0
				jumpingrn=1
				playsound(JumpSound,.2,.3)
			}
		}
	}
}

//this code makes you stop your upward momentum midair
if(jumpingrn)
{
	if(yvel<0)
	{
		if(jump=0)and(tertiary=0)
		{
			yvel*=.6
		}
	}
	else
	{
		jumpingrn=0
	}
}

if(primary or secondary)and(primarypressed=0) // primary enters a buffer state
{
	primarypressed=1
	primarybuffer=8
}
else
{
	if(primarybuffer>0){primarybuffer-=1}
}

var owneriherit = self
//ATTACK
if(animation<2 or animation = 4)and(primarybuffer>0)and(down<.5 or grounded)
{
	playsound(SweepSound,.25,.75)
	if(abs(right-left)>0){image_xscale=sign(right-left)}
	image_index=0
	animation=2
	instance_create_depth(x,y,depth,Hitbox,
	{
		image_xscale:3,
		image_yscale:1.8,
		animation,
		refx:image_xscale*8,
		owner:owneriherit
	})
	primarybuffer=0
	image_speed=1
	sprite_index=JanitorSweepSpr
	if(coyote<=0)and(yvel>.5){yvel=.5}
}
//Roll Attack UNUSED
if(animation=1)and(primarybuffer>0)and(down)and(1=0)
{
	spinning=18
	animation=3
	primarybuffer=0
	sprite_index=JanitorRollSweepSpr
	instance_create_depth(x,y,depth,Hitbox,
	{
		image_xscale:2.5,
		image_yscale:2.5,
		animation,
		owner:owneriherit,
		refy:6
	})
}
if(animation=3)
{
	spinning-=1
	if(spinning<=0)
	{
		animation=1
		sprite_index=JanitorRollSpr
	}
}
//broom pogo
if(coyote<=0)and(down)and(animation<2)and(primarybuffer>0)
{
	playsound(SweepSound,.1,.5)
	primarybuffer=0
	animation=4
	image_index=0
	sprite_index=JanitorPogoSpr
	instance_create_depth(x,y,depth,Hitbox,
	{
		animation,
		owner:owneriherit,
		refy:16,
		image_yscale:2
	})
}
if(animation=4)
{
	if(place_meeting(x,y+24,walllayer))
	{
		image_index=1
	}
	else
	{
		image_index=0
	}
	if(place_meeting(x,y+10,walllayer) or place_meeting(x,y+yvel*1.1,walllayer))and(yvel>0)
	{
		playsound(BroomPogoSound,.1,.5)
		image_speed=1
		instance_create_depth(x,y+14,depth-1,Effect)
		yvel=-.9*yvel
		coyote=0
		animation=1
		sprite_index=JanitorRollSpr
	}
}


if(sprite_index=JanitorSlideSpr)or(sprite_index=JanitorRollSpr)or(animation=2)or(animation=3)or(animation=4)
{
	fric=slidefric
	tempwalk*=.2
}
else
{
	fric=normalfric
}
if(animation=2)
{
	if(coyote>0)and(timer mod 6 = 1)and(abs(xvel)>1)
	{
		instance_create_depth(x,y+12,depth-1,Effect,{sprite_index:SmallDustSpr,maxframes:2})
	}
	if(image_index>=6.5){animation=0}
	tempwalk=0
}

if(mag)and sprite_index!=JanitorSlideSpr and sprite_index!=JanitorDuckSpr
{
	xvel+=(right-left)*tempwalk
}

//echo target
if(grab)and(grabpressed=0)and(instance_exists(Ghost))
{
	playsound(EchoSound,.25)
	grabpressed=1
	var temptarg = instance_nearest(x,y,Ghost)
	instance_create_depth(x,y,depth,Echo,{targ:temptarg})
}


//button releases
if(jumppressed)and(jump=0)and(tertiary=0){jumppressed=0}
if(primarypressed)and(primary=0)and(secondary=0){primarypressed=0}
if(grabpressed)and(grab=0){grabpressed=0}

//falling sparkles
if(yvel>4.5)and(timer mod 6 = 0)and(sprite_index=JanitorPogoSpr)
{
	instance_create_depth(other.x,other.y,depth-100,Effect,{sprite_index:HitStarSpr,maxframes:6,image_index:choose(1,1,2,2,3)})
}

//ultimate failsafe
if(image_xscale>0){image_xscale=1}else{image_xscale=-1}

update_physics()