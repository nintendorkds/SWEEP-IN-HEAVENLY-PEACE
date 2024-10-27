// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_physics(_bounces=0,_playssound=0,_yvelfric=0){
	xvel*=fric;
	if(_yvelfric){yvel*=_yvelfric;}
	
	var walllayer = Wall
	if(layer_exists("WallTiles"))
	{
		walllayer = layer_tilemap_get_id("WallTiles")
	}
	
	//bounces code
	var startxvel = xvel
	var startyvel = yvel
	var hitwall = 0
	
	var maxEdgeTolerance=6
	
	if (place_meeting(x+xvel,y,Wall))or(place_meeting(x+xvel,y,walllayer))
	{
		var yoff = 1
		var foundgap = false
		
		if(abs(xvel)>abs(yvel))
		{
			while(yoff <= maxEdgeTolerance) {
		        if(!place_meeting(x + xvel, y + yoff, Wall))and(!place_meeting(x + xvel, y + yoff, walllayer)) {
		            y += yoff; //found a gap below edge
		            foundgap = true;
		            break;
		        } else if(!place_meeting(x + xvel, y - yoff, Wall))and(!place_meeting(x + xvel, y - yoff, walllayer)) {
		            y -= yoff; //found a gap above edge
		            foundgap = true;
		            break;
		        } else {
		            yoff+=.01; //no gap, increase the offset by .01
		        }
		    }
	    }
		
		if(!foundgap)
		{
			while(!place_meeting(x+sign(xvel)*.1,y,Wall))and(!place_meeting(x+sign(xvel)*.1,y,walllayer))
			{
				x = x + sign(xvel)*.1;
			}
			xvel = 0;
			hitwall=1
		}
	}
	x=xvel+x;

	if (place_meeting(x,y+yvel,Wall))or(place_meeting(x,y+yvel,walllayer))
	{
		var xoff = 1
		var foundgap = false
		if(yvel>0){maxEdgeTolerance=0} // keeps player from slipping off platforms
		
		if(abs(xvel)<abs(yvel))
		{
			while(xoff <= maxEdgeTolerance) {
		        if(!place_meeting(x + xoff, y + yvel, Wall))and(!place_meeting(x + xoff, y + yvel, walllayer)) {
		            x += xoff; //found a gap below edge
		            foundgap = true;
		            break;
		        } else if(!place_meeting(x - xoff, y + yvel, Wall))and(!place_meeting(x - xoff, y + yvel, walllayer)) {
		            x -= xoff; //found a gap above edge
		            foundgap = true;
		            break;
		        } else {
		            xoff+=.01; //no gap, increase the offset by .01
		        }
		    }
	    }
		
		if(!foundgap)
		{
			while(!place_meeting(x,y+sign(yvel)*.1,Wall))and(!place_meeting(x,y+sign(yvel)*.1,walllayer))
			{
				y = y + sign(yvel)*.1;
			}
			yvel = 0;
			hitwall=1
		}
	}
	y=yvel+y;
}