/// @description Set the views & cameras

//Enable views
view_enabled = true;

view_set_visible(0, true);

view_set_wport(0,1920);
view_set_hport(0,1080);

window_set_rectangle((display_get_width()-view_wport[0])*0.5,(display_get_height()-view_hport[0])*0.5,view_wport[0],view_hport[0]);
surface_resize(application_surface,view_wport[0],view_hport[0]);


//Create camera
camera = camera_create_view(0,0,720,405,0,Knight,-1,-1,500,500);

view_set_camera(0,camera);
