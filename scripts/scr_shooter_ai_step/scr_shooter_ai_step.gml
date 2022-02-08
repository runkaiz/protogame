/// @description scr_shooter_ai_step(targetenemy,wall,speed,assaulter?,enemybullet)
/// @param targetenemy
/// @param wall
/// @param speed
/// @param assaulter?
/// @param enemybullet
function scr_shooter_ai_step(argument0, argument1, argument2, argument3, argument4) {

	//Initialise some variables
	var var_nearestwall, var_enemy;
	var_enemy=argument0 //target enemy
	var_nearestwall=instance_nearest(x,y,argument1)   //nearest cover object

	mp_potential_settings(60,1,30,1)  //Configure pathfinding skill

	////FEAR CONTROL//////
	/*
	    Fear level increases when an enemy bullet passes close by and decreases
	    slowly while not.
	    Fear level influences the behaviour - high fear will make the AI seek
	    cover and low Fear will make them attack.
	*/    
	scr_fear_control(argument4)

	/////FINITE STATE MACHINE//////
	/*
	    States are switched depending on what fear level the AI has.
	*/

	if fear >= fear_max/2  //if fear level is greater than half
	{
	    scr_find_cover(var_nearestwall,var_enemy,argument2);  //get in cover!
	}

	else
	{
	    if fear >= fear_max/3  //if fear level is between 1/2 and 1/3
	    {
	        scr_peek_cover(var_nearestwall,var_enemy,argument2,argument1);  //peek out from your cover
	    }
        
	    else
	    {   //if fear level is near 0, you are allowed to assault and the enemy's fear level is in peek mode or worse...
	        if fear <= 1 && argument3=1 && var_enemy.fear >= var_enemy.fear_max/3  
	        {
	            scr_assault(var_enemy,argument1,argument2);   //assault the enemy
	        }
	        else  //otherwise....
	        {
	            scr_seek(var_nearestwall,var_enemy,argument2,argument1);  //try to get closer and suppress/engage enemy from cover
	        }
	    }
	}



}
