/// @description Draw above everything on GUI
if !(visible) {exit;}

var _bar_y = console_y + console_height - console_bar_height;

// Draw console layout
draw_set_alpha(console_bg_alpha);
draw_set_colour(console_bg_color);
draw_rectangle(console_x, console_y, console_x + console_width, _bar_y, false);

draw_set_colour(console_bar_color);
draw_rectangle(console_x, _bar_y, console_x + console_width, _bar_y + console_bar_height, false);

// Draw console bar text
var _console_msg =  console_text_actual +
					( console_text_blink_t < room_speed * .66
					&& string_length(keyboard_string) < console_bar_max_chars
					? "_"
					: "" );

draw_set_alpha(console_text_alpha);
draw_set_colour(console_text_actual_color);
draw_set_font(console_text_font);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text(console_x + console_log_xpad, _bar_y + console_bar_height/2 + 1, _console_msg);

// Draw text in console
if !(surface_exists(console_surf)) {
	event_user(0);
}

draw_surface(console_surf, console_x + console_log_xpad, console_y + console_log_ypad);

// Draw scrollbar
if (console_log_total_h > 0) {
	var _sidebar_x = console_x + console_width - console_log_xpad - 1;
	var _sidebar_y = console_y + console_log_ypad;
	var _sidebar_max_h = ((console_height - console_bar_height - (2 * console_log_ypad)));
	draw_set_alpha(console_bg_alpha);
	draw_set_color(console_text_actual_color);
	draw_rectangle(_sidebar_x - 2,
				   _sidebar_y + console_surf_yoffset/console_log_total_h * _sidebar_max_h - 1,
				   _sidebar_x + 2,
				   _sidebar_y + console_surf_yoffset/console_log_total_h * _sidebar_max_h + 1,
				   false);
}

// Draw fps
draw_set_alpha(1);
if (console_fps_show) {
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_colour(console_text_actual_color);
	
	var _x = window_get_width() - 2;
	var _y = 2;
	
	draw_text(_x, _y, "FPS: " + console_fps + "\n" +
					  "FPS REAL: " + console_fps_real + "\n" +
					  "FPS AVG: " + console_fps_avg);
}