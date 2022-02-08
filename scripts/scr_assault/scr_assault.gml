/// @description scr_assault(targetenemy,wallobject,speed)
/// @param targetenemy
/// @param wallobject
/// @param speed
function scr_assault(argument0, argument1, argument2) {

	/*
	    Move towards the enemy until you are within 30px or have complete line of sight.
	    For further aggression, delete the "or collision_line(..." 
	*/

	//if there is line of sight to the enemy then shoot!
	if !collision_line(x,y,argument0.x,argument0.y,argument1,1,1)
	    can_shoot=1
	else
	    can_shoot=0

	//if further than 30px or no line of sight....
	if point_distance(x,y,argument0.x,argument0.y) > 30 or collision_line(x,y,argument0.x,argument0.y,argument1,1,1)
	{            
	    mp_potential_step(argument0.x,argument0.y,argument2,0) //move towards enemy
	    fear-=1  //decrease fear levels
	}



}
