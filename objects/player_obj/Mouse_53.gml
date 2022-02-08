var bullet=instance_create(x,y,blue_bullet);
bullet.owner=id
bullet.direction=point_direction(x,y,mouse_x,mouse_y)+random_range(-3,3)
bullet.speed=10

