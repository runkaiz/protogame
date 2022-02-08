/// @description scr_peak_cover(nearestwall,targetenemy,speed,wallobject)
/// @param nearestwall
/// @param targetenemy
/// @param speed
/// @param wallobject
function scr_peek_cover(argument0, argument1, argument2, argument3) {

	/*
	Gradually move round your nearest cover until it doesn't block
	your line of sight to the enemy. If there are no walls in the way
	then you can shoot!
	*/

	//if no walls in the way then shoot!
	if !collision_line(x,y,argument1.x,argument1.y,argument3,1,1)
	    can_shoot=1
	else
	    can_shoot=0
        
	if collision_line(x+lengthdir_x(sprite_width/2,point_direction(x,y,argument0.x,argument0.y)),y+lengthdir_y(sprite_width/2,point_direction(x,y,argument0.x,argument0.y)),argument1.x,argument1.y,argument0,1,1)
	//if the nearest cover is blocking line of sight to the enemy...
	{
	    mp_potential_step(argument1.x,argument1.y,argument2,0)
	    //move toward the enemy
	}

	else
	    fear-=1 //if the cover is no longer in the way then decrease fear level




}
