timer+=1
if(timer>=5)
{
	var gridX = floor(x/16);
	var gridY = floor(y/16);
  
	var walllayer = layer_get_id("WallTiles");
	var wallmap = layer_tilemap_get_id(walllayer);
	if(place_meeting(x,y,wallmap))and(place_meeting(x,y,BreakableZone))
	{
		playsound(StepSound,.5,.25)
		tilemap_set(wallmap, 0, gridX, gridY);
		instance_create_depth(x,y,0,Effect,{maxframes:5,sprite_index:HitDustSpr})
		var tempdir = 0
		repeat 4 
		{
			tempdir+=90
			instance_create_depth(x+lengthdir_x(16,tempdir),y+lengthdir_y(16,tempdir),0,CrackJr)
		}
	}
	
	instance_destroy()
}