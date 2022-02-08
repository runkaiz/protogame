/// @description Setup
console_width	= window_get_width() / 2;
console_height	= window_get_height() / 3;

console_x		= 0;
console_y		= window_get_height() - console_height;

console_bg_color			= make_colour_rgb(7, 7, 30);
console_bg_alpha			= .66;

console_text_font			= fnt_Consolas;
console_text_alpha			= 1.0;
console_text_log			= ds_list_create();
console_text_actual			= "";
console_text_actual_color	= c_white;
console_text_blink_t		= 0;

console_bar_height			= 16;
console_bar_color			= make_colour_rgb(15, 15, 60);
console_bar_max_chars		= 90;

console_log_xpad			= 4;
console_log_ypad			= 4;
console_log_total_h			= 0;

console_surf				= -1;
console_surf_yoffset		= 0;

console_key_toggle			= vk_f1;
console_key_nav_up			= vk_up;
console_key_nav_down		= vk_down;

console_nav = 0;

console_fps_t		= 0;
console_fps_show	= false;
console_fps_real	= string_format(fps_real, 5, 0);
console_fps			= string_format(fps, 5, 0);
console_fps_avg		= string_format(fps, 5, 0);

console_fps_hist	= [];

depth = -100;

/* Initial message */
var _init_message = console_get_message(CONSOLE_MESSAGES.INTIALIZATION, "");
console_write_log(_init_message, CONSOLE_TYPES.WARNING);