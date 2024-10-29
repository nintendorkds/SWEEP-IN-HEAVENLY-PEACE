if(y<=other.bbox_top)and(yvel>0)and(other.object_index!=EnemyCorpse)
{
	if(other.object_index=Nerdy)
	{
		playsound(HitSound,.1)
		playsound(StompSound,.1)
		instance_create_depth(x,other.bbox_top,depth-1,Effect)
		yvel=-6
		animation=0
		other.image_index=0
		other.sprite_index=NerdyBounceSpr
	}
	else
	{
		var tempdir = choose(22.5,0)
		repeat 8
		{
			tempdir+=45
			var tempvel = random_range(1.5,2.5)
			instance_create_depth(other.x,other.y,depth-100,Effect,{sprite_index:HitStarSpr,maxframes:6,image_index:choose(0,0,1,1,2),xvel:lengthdir_x(tempvel,tempdir),yvel:lengthdir_y(tempvel,tempdir)})
		}
		playsound(HitSound,.1)
		playsound(StompSound,.1)
		instance_create_depth(other.x,other.y,depth-100,Effect,{sprite_index:KillSpr,maxframes:4.5})
		instance_create_depth(x,other.bbox_top,depth-1,Effect)
		yvel=-4
		animation=0
		other.yvel+=4
		instance_destroy(other)
	}
}