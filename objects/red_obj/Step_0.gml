//lerp the sprite's position. Adjust the divider for more or less smoothing.
xx+=(x-xx)*spd/8
yy+=(y-yy)*spd/8

//spawning teammates
if fear<fear_max/2 && instance_number(red_obj)<4 && !instance_exists(drone)
{
    repeat(3)
    instance_create(irandom(room_width),-30,red_obj)
    fear=fear_max
}

if instance_exists(blue_parent) //if enemy exists then run the shooter AI
{

    scr_find_target(blue_parent,blue_bullet,wall_obj)  //choose the target enemy
    
    scr_shooter_ai_step(var_target_enemy,wall_obj,spd,assaulter,blue_bullet) //run shooter ai

    if can_shoot=1
    scr_shoot(red_bullet,9,point_direction(x,y,var_target_enemy.x,var_target_enemy.y)+irandom_range(-10,10)) //shoot if allowed!

}






