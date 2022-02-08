if instance_exists(red_obj) && instance_exists(drone)
{
draw_set_color(c_white)
draw_text(0,20,string_hash_to_newline("Press Space to call reinforcements!"))
}
draw_set_color(c_white)
draw_text(0,0,string_hash_to_newline("Enemy aggression: "+string((1100-global.enemyfearmax)/100)+". Press UP to change."))

