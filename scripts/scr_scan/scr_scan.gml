/// @description scr_scan()
function scr_scan() {

	if abs(look_dir-scan_dir)<10 //if look direction is close to the desired look direction
	{
	    scan_dir=irandom(360) //change the desired look direction to a random direction
	}

	look_dir+=(scan_dir-look_dir)/100   //smoothly look toward the desired direction
}
