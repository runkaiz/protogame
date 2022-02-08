/// @description scr_search(speed)
/// @param speed
function scr_search(argument0) {

	/*
	    This script will make the AI move to a random location in the room.
	    Once it gets there it will move to another random location to continue
	    searching.
	*/

	if distance_to_point(searchx,searchy) < 1 //if at the destination...
	{
		searchx=irandom(room_width) //set a new random destination
		searchy=irandom(room_height)
	}
	else
	{
		mp_potential_step(searchx,searchy,argument0,0) //otherwise pathfind to the destination
	}
	while (!place_free(searchx,searchy))  //if the destination is inside a wall
	{
		searchx=irandom(room_width) //reset the destination to another random location
		searchy=irandom(room_height)
	}



}
