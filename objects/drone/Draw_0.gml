draw_sprite(char_spr,3,xx,yy-20+5*sin(degtorad(b))) //draw sprite
draw_sprite_ext(char_spr,3,xx,yy,1,-0.5,0,c_black,0.2) //draw shadow

if state = 0{  //if in the search state then draw the view cone with an alpha of 0.1
draw_set_alpha(0.1)
        //draw the view cone using draw trianle
draw_triangle_color(xx,yy-20+5*sin(degtorad(b)),x+lengthdir_x(200,look_dir-30),y+lengthdir_y(250,look_dir-30),x+lengthdir_x(200,look_dir+30),y+lengthdir_y(250,look_dir+30),col_look,col,col,0)
}
else
{
draw_set_alpha(0.4)  //if in the alert state then draw it with an alpha of 0.4
draw_triangle_color(xx,yy-20+5*sin(degtorad(b)),x+lengthdir_x(200,look_dir-30),y+lengthdir_y(250,look_dir-30),x+lengthdir_x(200,look_dir+30),y+lengthdir_y(250,look_dir+30),col_alert,col,col,0)
}
draw_set_alpha(1)

