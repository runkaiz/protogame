/// @description scr_fear_control(enemybullet)
/// @param enemybullet
function scr_fear_control(argument0) {

	/*
	    Bullets passing near to the AI will cause an increase in the fear level
	    up to the fear_max. A higher fear_max will be a more cowardly enemy, since
	    it will need to stay in cover longer
	*/

	fear=clamp(fear,0,fear_max) //limit cowardice between 0 and max

	if instance_exists(argument0) //if an enemy bullet exists
	    {
	        var nb=instance_nearest(x,y,argument0)  //define the nearest enemy bullet
	        if point_distance(x,y,nb.x,nb.y)<50   //if the nearest bullet is within 50px...
	        fear+=fear_max/2    //increase fear level
	    }



}
