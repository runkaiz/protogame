/// @description scr_hunt_step(targetobect,wallobject,speed,view_cone_angle,max_view_dist)
/// @param targetobect
/// @param wallobject
/// @param speed
/// @param view_cone_angle
/// @param max_view_dist
function scr_hunt_step(argument0, argument1, argument2, argument3, argument4) {

	/*
	    This AI switches between two states, one where it randomly searches and
	    the other where it moves to the last known location of the enemy once
	    they've been spotted.
	*/

	var target=argument0 //initialise temp variable for target

	//////SEARCH STATE///////

	if state == 0
	{
	    scr_scan()  //scan the view cone
    
	    // scr_search(0.7)   //search randomly
    
	    if !collision_line(x,y,target.x,target.y,argument1,1,1)   //if line of sight to enemy...
	    && distance_to_point(target.x,target.y) < argument4       //and within a certain distance....
	    && (abs(angle_difference(look_dir,point_direction(x,y,target.x,target.y))) < argument3 //and within the view cone
	    or distance_to_point(target.x,target.y) < sprite_width/2)  //or just really close!
	    {
	        isHunting = true  //switch to the hunt state
	    }
	}

	////////HUNT STATE/////////

	if state == 1
	{
	    look_dir = point_direction(x,y,seenx,seeny) //change the look direction to be looking at the last known location
    
	    if !collision_line(x,y,target.x,target.y,argument1,1,0) //if there is line of sight to the enemy....
	    {
	        seenx = target.x  //...then update the last seen location
	        seeny = target.y
	    }
	    if distance_to_point(seenx,seeny) > 0 { //if not at the last seen location...
	        mp_potential_step(seenx,seeny,argument2,1)  //move toward the last seen location
			if (seenx >= x) {
				image_xscale = 1;	
			} else {
				image_xscale = -1;	
			}
		}
	    else
	        state = 0  //if arrived at the last seen location then switch back to search mode
	}
}
