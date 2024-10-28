var walllayer = Wall
if(layer_exists("WallTiles"))
{
	walllayer = layer_tilemap_get_id("WallTiles")
}
timer+=1
if(place_meeting(x+(2*image_xscale),y,walllayer))
{
	image_xscale*=-1
}
x+=2*image_xscale
if(place_meeting(x,y+(sin(timer/3)),walllayer)=0)
{
	y+=sin(timer/3)
}