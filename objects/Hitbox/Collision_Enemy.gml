var check = id
if(array_contains(other.hitboxarray,check)=0)
{
	playsound(HitSound,.1)
	array_push(other.hitboxarray,check)
	var hitdir = point_direction(x,y,other.x,other.y)
	other.xvel=lengthdir_x(5,hitdir)
	other.yvel=lengthdir_y(5,hitdir)
	instance_create_depth(other.x,other.y,depth-100,Effect,{sprite_index:KillSpr,maxframes:4.5})
	instance_create_depth(other.x,other.y,depth-1,Effect,{sprite_index:HitDustSpr,maxframes:6})
	if(other.object_index!=EnemyCorpse)
	{
		var tempdir = choose(22.5,0)
		repeat 8
		{
			tempdir+=45
			var tempvel = random_range(1.5,2.5)
			instance_create_depth(other.x,other.y,depth-100,Effect,{sprite_index:HitStarSpr,maxframes:6,image_index:choose(0,0,1,1,2),xvel:lengthdir_x(tempvel,tempdir),yvel:lengthdir_y(tempvel,tempdir)})
		}
		instance_destroy(other)
	}
	else
	{
		other.timer=0
	}
}