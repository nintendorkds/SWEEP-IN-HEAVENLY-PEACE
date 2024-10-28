timer+=1
if(instance_exists(targ)=0){instance_destroy();exit}
var tempdir = point_direction(x,y,targ.x,targ.y)
x+=lengthdir_x(4,tempdir)
y+=lengthdir_y(4,tempdir)
if(timer mod 4 = 0)
{
	instance_create_depth(x,y,depth-100,Effect,{sprite_index:EchoSpr,maxframes:4.5})
}
if(distance_to_point(targ.x,targ.y)<8){instance_destroy();instance_create_depth(x,y,depth-100,Effect,{sprite_index:EchoSpr,maxframes:4.5})}