/// @description scr_find_target(enemy,enemy_bullet,wallobject)
/// @param enemy
/// @param enemy_bullet
/// @param wallobject
function scr_find_target(argument0, argument1, argument2) {
	/*
	This script will either set the AI's current target to whichever
	enemy is the most threat. Either the closest one or one that is shooting
	at the AI from a good location
	*/

	if instance_exists(argument0)
	var ne=instance_nearest(x,y,argument0) //initialise a temporary variable for the nearest enemy

	//if your current target is destroyed or you have a line of sight with the nearest enemy
	if !instance_exists(var_target_enemy) or !collision_line(x+lengthdir_x(argument2.sprite_width,point_direction(x,y,ne.x,ne.y)),y+lengthdir_y(argument2.sprite_width,point_direction(x,y,ne.x,ne.y)),ne.x,ne.y,argument2,1,1)
	    var_target_enemy=ne //set your current target to the nearest enemy

	if instance_exists(argument1)//if enemy bullet exists
	{ 
	    var nb=instance_nearest(x,y,argument1) //initialise a temporary variable for the nearest enemy bullet
   
	     //if the nearest bullet is <20px away and there is a line of sight to it...
	    if distance_to_point(nb.x,nb.y)<20 && !collision_line(x,y,nb.x,nb.y,argument2,1,1)
	    { 
	        if instance_exists(nb.owner)
	        var_target_enemy=nb.owner //set your current target to whoever fired that bullet!
	    }
	}



}
