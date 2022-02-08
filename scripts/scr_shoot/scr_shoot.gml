/// @description scr_shoot(bullet,speed,direction)
/// @param bullet
/// @param speed
/// @param direction
function scr_shoot(argument0, argument1, argument2) {

	rof_timer-=1 //timer countdown between shots

	if rof_timer<=0
	    {
	    var bullet; //create a bullet with the following attributes
	    bullet=instance_create(x,y,argument0) 
	    bullet.speed=argument1
	    bullet.direction=argument2
	    bullet.owner=id //set the bullet "owner" to the id of the shooter
	    rof_timer=10+irandom(30)
	    }



}
