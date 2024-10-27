yvel+=.2
var walllayer = Wall
if(layer_exists("WallTiles"))
{
	walllayer = layer_tilemap_get_id("WallTiles")
}
if(timer mod 8 = 0)
{
	image_angle+=-90*image_xscale
}
timer+=1
if(timer=10)
{
	image_blend=make_color_rgb(40,40,80)
}
if(collision_point(x+xvel,y,walllayer,1,1)){xvel*=-1;instance_create_depth(other.x,other.y,depth-1,Effect,{sprite_index:HitDustSpr,maxframes:6,image_blend})}
x+=xvel
if(collision_point(x,y+yvel,walllayer,1,1)){yvel*=-.8;instance_create_depth(other.x,other.y,depth-1,Effect,{sprite_index:HitDustSpr,maxframes:6,image_blend})}
y+=yvel
if(timer>=90){instance_destroy()}