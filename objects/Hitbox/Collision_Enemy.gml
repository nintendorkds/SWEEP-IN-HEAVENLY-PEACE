var check = id
if(array_contains(other.hitboxarray,check)=0)
{
	array_push(other.hitboxarray,check)
	var hitdir = point_direction(x,y,other.x,other.y)
	other.xvel=lengthdir_x(5,hitdir)
	other.yvel=lengthdir_y(5,hitdir)
	instance_create_depth(other.x,other.y,depth-100,Effect,{sprite_index:KillSpr,maxframes:4.5})
	instance_create_depth(other.x,other.y,depth-1,Effect,{sprite_index:HitDustSpr,maxframes:6})
	if(other.object_index!=EnemyCorpse)
	{
		instance_destroy(other)
	}
}