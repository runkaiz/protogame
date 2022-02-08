/// @description scr_find_cover(nearestwall,targetenemy,speed)
/// @param nearestwall
/// @param targetenemy
/// @param speed
function scr_find_cover(argument0, argument1, argument2) {

	/*
	    If there is line of site between the target enemy and yourself, then
	    move behind the nearest wall.
	*/

	can_shoot=0  //don't shoot while in this state

	if !collision_line(x+lengthdir_x(argument0.sprite_width,point_direction(argument0.x,argument0.y,x,y)),y+lengthdir_y(argument0.sprite_width,point_direction(argument0.x,argument0.y,x,y)),argument1.x,argument1.y,argument0,1,1)
	//if line of sight....
	{
	    //pathfind to a point behind the nearest wall relative to the enemy
	    mp_potential_step(argument0.x+lengthdir_x(argument0.sprite_width,point_direction(argument1.x,argument1.y,argument0.x,argument0.y)),argument0.y+lengthdir_y(argument0.sprite_width,point_direction(argument1.x,argument1.y,argument0.x,argument0.y)),argument2*2,0)
	}
	else
	{
	    //if there is no line of sight (you are in cover), then decrease your fear level.
	    fear-=1
	}



}
