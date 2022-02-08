//lerp the sprite's position. Adjust the divider for more or less smoothing.
xx+=(x-xx)*spd/20
yy+=(y-yy)*spd/20

if gamemode=0  //patrolling drones mode
{
    scr_hunt_step(player_obj,wall_obj,0.6,30,250)  //run the hunt script
    
    if state=1  //spawn enemies if in the alert state
    {
        if instance_number(red_obj)<3
        {
            var spawndir=point_direction(player_obj.x,player_obj.y,x,y)+irandom_range(-45,45)
            instance_create(room_width/2+lengthdir_x(500,spawndir),room_height/2+lengthdir_y(500,spawndir),red_obj)
        }   
    }

}
else   //all out war mode!
{
    move_towards_point(x,-50,3)
    if yy<-30
    {
        instance_create(random(room_width),-50,red_obj)
        instance_destroy()
    }
}

