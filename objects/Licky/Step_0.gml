var walllayer = Wall
if(layer_exists("WallTiles"))
{
	walllayer = layer_tilemap_get_id("WallTiles")
}
timer+=1
if(place_meeting(x+(1*image_xscale),y,walllayer))
{
	image_xscale*=-1
}
x+=1*image_xscale
if(place_meeting(x,y+(1*ydir),walllayer))
{
	ydir*=-1
}
y+=1*ydir