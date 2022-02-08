/// @description scr_seek(nearestwall,targetenemy,speed,wallobject)
/// @param nearestwall
/// @param targetenemy
/// @param speed
/// @param wallobject
function scr_seek(argument0, argument1, argument2, argument3) {

	/*
	    This behaviour tries to put the AI in a position where it has line
	    of sight to either the enemy, or the enemy's cover.
	    If it manages to get line of sight to the enemy's cover then it will assess
	    it's own cover.
	    If no nearby cover then it will find some, otherwise it will
	    shoot at the enemy.
	*/

	//if no line of sight between you and 2x wall widths in front of the enemy...  
	if collision_line(x,y,argument1.x+lengthdir_x(argument3.sprite_width*2,point_direction(argument1.x,argument1.y,x,y)),argument1.y+lengthdir_y(argument3.sprite_width*2,point_direction(argument1.x,argument1.y,x,y)),argument3,1,1)
	{
	    //move towards the enemy
	    mp_potential_step(argument1.x,argument1.y,argument2,0)
	    can_shoot=0
	}

	else
	{
	    can_shoot=1
	    //otherwise, if the enemy is in cover (no line of sight) or distance to the nearest cover is less than a wall's width away...
	    if collision_line(x,y,argument1.x,argument1.y,argument3,1,1) or point_distance(x,y,argument0.x,argument0.y) <= argument3.sprite_width
	        fear-=1  //decrease fear levels
	    else
	        fear=30+fear_max/2  //increase fear levels because you're not in cover and in danger!
                        
	} 



}
