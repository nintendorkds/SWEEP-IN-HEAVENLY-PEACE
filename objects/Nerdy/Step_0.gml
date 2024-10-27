var walllayer = Wall
if(layer_exists("WallTiles"))
{
	walllayer = layer_tilemap_get_id("WallTiles")
}
if(sprite_index=NerdyBounceSpr)and(image_index>=3)
{
	sprite_index=NerdySpr
}
timer+=1
if(place_meeting(x,y+(sin(timer/6)),walllayer)=0)
{
	y+=sin(timer/6)
}