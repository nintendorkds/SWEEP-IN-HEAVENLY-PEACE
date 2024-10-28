if(disappear)
{
	instance_create_depth(x,y,depth-1,Effect,{sprite_index:HitDustSpr,maxframes:6})
}
else
{
	instance_create_depth(x,y,0,EnemyCorpse,{sprite_index:deathsprite,image_xscale,xvel,yvel,hitboxarray:hitboxarray})
}