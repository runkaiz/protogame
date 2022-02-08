//Movement
if keyboard_check(ord("W")) && place_free(x,y-spd)
y-=spd
if keyboard_check(ord("S")) && place_free(x,y+spd)
y+=spd
if keyboard_check(ord("A")) && place_free(x-spd,y)
x-=spd
if keyboard_check(ord("D")) && place_free(x+spd,y)
x+=spd

//lerp the sprite's position. Adjust the divider for more or less smoothing.
xx+=(x-xx)*spd/8
yy+=(y-yy)*spd/8

//fear control - in order to work with the shooter AI
scr_fear_control(red_bullet)
fear-=1

//spawning teammates
if fear<=1 && instance_number(blue_obj)<5 && !instance_exists(drone)
instance_create(irandom(room_width),room_height+30,blue_obj)

//formation
var i;
for (i=0; i<instance_number(blue_obj); i+=1)
{
    var blue=instance_find(blue_obj,i);
    blue.fx = 30* (i div 3)
    blue.fy = 50* (i mod 3)
}

