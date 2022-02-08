//lerp the sprite's position. Adjust the divider for more or less smoothing.
xx+=(x-xx)*spd/8
yy+=(y-yy)*spd/8

if instance_exists(red_obj) //if enemy exists then run the shooter AI
{

    scr_find_target(red_obj,red_bullet,wall_obj)  //choose the target enemy
    
    scr_shooter_ai_step(var_target_enemy,wall_obj,spd,assaulter,red_bullet) //run shooter ai

    if can_shoot=1
    scr_shoot(blue_bullet,9,point_direction(x,y,var_target_enemy.x,var_target_enemy.y)+irandom_range(-10,10)) //shoot if allowed!
    
}

else

{

    mp_potential_step(player_obj.x-30+fx,player_obj.y+40+fy,spd,0)  //move into formation around player
        
}

