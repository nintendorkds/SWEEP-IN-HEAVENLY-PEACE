var walllayer = Wall
if(layer_exists("WallTiles"))
{
	walllayer = layer_tilemap_get_id("WallTiles")
}

if(instance_exists(Player)=0){exit}

var targ = instance_nearest(x,y,Player)


if(place_meeting(x,y+1,Wall))or(place_meeting(x,y+1,walllayer))
{
	yvel=0
	if(grounded = 0)
	{
		sprite_index=RickyJrSpr
		xvel=0
		//landing
		instance_create_depth(x+8,y+8,depth-1,Effect)
		instance_create_depth(x-8,y+8,depth-1,Effect)
		crouchframes=4
	}
	grounded = 1
}
else
{
	xvel=sign(image_xscale)*2.5
	grounded=0
	yvel+=.25
	if(place_meeting(x+xvel*1.5,y,walllayer)){image_xscale*=-1}
}

if(cooldown<=0)
{
	if(distance_to_object(targ)<80)and(grounded)
	{
		playsound(JumpSound,.2,.3)
		instance_create_depth(x,y+4,depth-1,Effect)
		if(targ.x>x){image_xscale=-1}else{image_xscale=1}
		yvel=choose(-3,-4,-3.5)
		sprite_index=RickyJrJumpSpr
		cooldown=10
	}
}
else
{
	if(grounded){cooldown-=1}
}

update_physics()