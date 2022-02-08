spd=1.2 //set the speed
xx=x //"smooth" x position
yy=y//"smooth" y position
scr_shooter_ai_create(global.enemyfearmax) //initialise the shooter ai
assaulter=instance_number(red_obj) mod 2 //AI will be an assaulter on each even number.
                                            //Assaulters can charge the enemy

