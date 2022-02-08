/// @description Draw hp
draw_self();
draw_set_color(c_black);
draw_set_font(example_font);
draw_set_alpha(1);
draw_text(camera_get_view_x(view_camera[view_current])+600,camera_get_view_y(view_camera[view_current])+10,"HP: "+string(hp));