///@function draw_grid_accurate(x1, y1, x2, y2, cell width, cell height, grid_color [optional], grid alpha [optional])

// Draws a grid whose coordinates will be accurate across different hardware. 

// See the below topic for more information about the inconsistencies of drawing functions across different hardware:
// https://forum.yoyogames.com/index.php?threads/drawing-lines-not-recommended.18246/ 

// !!! If you draw a very large grid with numerous small cells though, this will use up a lot of preformance so keep that it mind. !!!
// !!! In the above cases, you should draw the grid to a surface and draw that surface instead to save preformance.				   !!!

// !!!							'draw_line_accurate()' is required to use this script!'											   !!!

/// @peram x1						  The x coordinate of the left side of the grid.
/// @peram y1						  The y coordinate of the top side of the grid.
/// @peram x2						  The x coordinate of the right side of the grid.
/// @peram y2						  The y coordinate of the bottom side of the grid.
/// @peram cell width				  The horizontal size of each cell in the grid.
/// @peram cell height				  The vertical size of each cell in the grid.
/// @peram grid width				  The width of the entire grid.
/// @peram grid height				  The height of the entire grid.
/// @peram grid color				  The color to draw the grid in. Optional; leave this argument blank or set it to 'undefined' to draw with the currently active draw color.
/// @peram grid alpha				  The alpha to draw the grid with. Optional; leave this argument blank or set it to 'undefined' to draw with the current draw alpha.

// Example: draw_grid_accurate(0, 0, room_width, room_height, 16, 16);

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function draw_grid_accurate(grid_x1, grid_y1, grid_x2, grid_y2, cell_width, cell_height, grid_color = draw_get_color(), grid_alpha = draw_get_alpha())
{
	var grid_width = (grid_x2 - grid_x1) + 1, grid_height = (grid_y2 - grid_y1) + 1
	
	var h_amount;
	if (cell_width = 0) or (cell_width = 1) h_amount = 0; else h_amount = (grid_width div cell_width) + 1;
	
	var v_amount;
	if (cell_height = 0) or (cell_height = 1) v_amount = 0; else v_amount = (grid_height div cell_height) + 1;
	
	var vertical_line_x1 = grid_x1, vertical_line_y1 = grid_y1, vertical_line_x2 = vertical_line_x1, vertical_line_y2 = grid_y2;
	for (var i = 0; i < h_amount; i ++;)
	{
		draw_line_accurate(vertical_line_x1, vertical_line_y1, vertical_line_x2, vertical_line_y2, grid_color, grid_alpha);
		vertical_line_x1 += cell_width; vertical_line_x2 = vertical_line_x1;
	}
	
	var horizontal_line_x1 = grid_x1, horizontal_line_y1 = grid_y1, horizontal_line_x2 = grid_x2, horizontal_line_y2 = horizontal_line_y1;
	for (var i = 0; i < v_amount; i ++;)
	{
		draw_line_accurate(horizontal_line_x1, horizontal_line_y1, horizontal_line_x2, horizontal_line_y2, grid_color, grid_alpha);
		horizontal_line_y1 += cell_height; horizontal_line_y2 = horizontal_line_y1;
	}
}
