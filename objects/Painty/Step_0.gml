var walllayer = Wall
if(layer_exists("WallTiles"))
{
	walllayer = layer_tilemap_get_id("WallTiles")
}

if(instance_exists(Player)=0){exit}

var targ = instance_nearest(x,y,Player)

if(targ.image_xscale = sign(targ.x-x))and(distance_to_object(targ)<160)
{
	depth=-y
	var speet = -2
	if(sprite_index!=PaintySpr)
	{
		instance_create_depth(x,y,depth-10,Effect,{maxframes:5,sprite_index:HitDustSpr})
		sprite_index=PaintySpr
	}
	if(targ.x>x){image_xscale=-1}else{image_xscale=1}
	var tempdir = point_direction(x,y,targ.x,targ.y)
	if(place_meeting(x+lengthdir_x(speet,tempdir),y,walllayer)=0)
	{
		x+=lengthdir_x(speet,tempdir)
	}
}
else
{
	depth=0
	image_xscale=1
	if(sprite_index!=PaintyHideSpr)
	{
		instance_create_depth(x,y,depth-10,Effect,{maxframes:5,sprite_index:HitDustSpr})
		sprite_index=PaintyHideSpr
	}
	if abs(x-targ.x)> 32
	{
		if(x>targ.x){image_index=0}else{image_index=2}
	}
	else
	{
		image_index=1
	}
	
}