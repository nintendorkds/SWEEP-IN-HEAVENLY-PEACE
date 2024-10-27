if(depthupdate){depth=-y}
//hitbox array. keeps track of what has hit the car and whether they are touching anymore
if(array_length(hitboxarray)!=0)
{
	for (var i = array_length(hitboxarray)-1; i >= 0; i--) {
		if(place_meeting(x,y,hitboxarray[i])=0)
		{
			array_delete(hitboxarray,i,1)
		}
	}
}