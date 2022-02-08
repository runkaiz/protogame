spd=1.2 //set the speed
xx=x //"smooth" x position
yy=y//"smooth" y position
fx=0 //formation offset
fy=0 //formation offset
scr_shooter_ai_create(200) //initialise the shooter ai
assaulter=instance_number(blue_obj) mod 2 //AI will be an assaulter on each even number.
                                            //Assaulters can charge the enemy

